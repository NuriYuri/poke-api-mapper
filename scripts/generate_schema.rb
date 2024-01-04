require 'csv'
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

# @param filename [String]
# @return [Hash]
def get_schema(filename)
  basename = File.basename(filename, '.csv')
  # @type [String]
  class_name = basename.capitalize.gsub(/_[a-z]/) { |v| v[1].upcase }
  *lines = File.open(filename) { |f| break([f.gets, f.gets]) }
  header, line1 = CSV.parse(lines.join, liberal_parsing: true) rescue CSV.parse(lines[0])

  return {
    class_name: class_name,
    fields: header.map.with_index { |header_name, index| parse_field(header_name, line1&.[](index).to_s) }
  }
end

# @param header_name [String]
# @param value [String]
def parse_field(header_name, value)
  return { name: header_name, type: Integer } if header_name == 'id' || header_name.end_with?('_id')
  return { name: header_name, type: Symbol } if header_name == 'identifier'
  return { name: header_name, type: TrueClass } if header_name.start_with?('is_') || header_name.start_with?('has_')
  return { name: header_name, type: Integer } if value.match?(/^[0-9]+$/)
  return { name: header_name, type: Float } if value.match?(/^[0-9]+\.[0-9]+$/)
  return { name: header_name, type: String }
end

# @param schema [Hash]
# @param file [File]
# @param filename [String]
def write_schema(schema, file, filename)
  file.puts("  class #{schema[:class_name]}")
  file.puts("    # @return [Array<#{schema[:class_name]}>]")
  file.puts("    DATA = []")
  schema[:fields].each do |field|
    write_attribute(field, file)
  end
  file.puts("    # @param row [Array]")
  file.puts("    def initialize(row)")
  schema[:fields].each_with_index do |field, index|
    write_attribute_initialize(field, index, file)
  end
  file.puts("    end")
  file.puts("    def self.load")
  file.puts("      return unless DATA.empty?")
  file.puts("      dat_filename = 'data/#{File.basename(filename, '.csv')}.dat'")
  file.puts("      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)")
  file.puts("      rows = CSV.read('#{filename}', liberal_parsing: true)")
  file.puts("      rows.shift")
  file.puts("      DATA.concat(rows.map { |row| new(row) })")
  file.puts("    end")
  file.puts("    def self.save")
  file.puts("      File.binwrite('data/#{File.basename(filename, '.csv')}.dat', Marshal.dump(DATA))")
  file.puts("    end")
  file.puts("  end")
end

# @param field [Hash]
# @param file [File]
def write_attribute(field, file)
  file.puts("    # @return [#{field[:type] == TrueClass ? 'Boolean' : field[:type]}]")
  file.puts("    attr_reader :#{field[:name]}")
end

# @param field [Hash]
# @param index [Integer]
# @param file [File]
def write_attribute_initialize(field, index, file)
  case field[:type].name
  when 'TrueClass'
    file.puts("      @#{field[:name]} = row[#{index}].to_i == 1")
  when 'Integer'
    file.puts("      @#{field[:name]} = row[#{index}].to_i")
  when 'Float'
    file.puts("      @#{field[:name]} = row[#{index}].to_f")
  when 'Symbol'
    file.puts("      @#{field[:name]} = row[#{index}].to_s.gsub(/[^a-z_]/, '_').to_sym")
  else
    file.puts("      @#{field[:name]} = row[#{index}].to_s")
  end
end

File.open('generated/schema.rb', 'w') do |f|
  f.puts("module PokeAPI")
  Dir['pokeapi/data/v2/csv/*.csv'].each do |filename|
    write_schema(get_schema(filename), f, filename)
  end
  f.puts("  module_function")
  f.puts("  def load_all")
  f.puts("    constants.each { |c| const_get(c).load }")
  f.puts("  end")
  f.puts("  def save_all")
  f.puts("    constants.each { |c| const_get(c).save }")
  f.puts("  end")
  f.puts("end")
end