require_relative '../lib/index'

if ARGV.size < 1
  puts "USAGE: ruby scripts/generate_type_by_gen.rb GEN_ID"
  Mapper.list_generations
  exit
end

require 'json'

PokeAPI::Types.load
PokeAPI::TypeEfficacy.load
PokeAPI::TypeEfficacyPast.load
generation_id = ARGV[0].to_i

types = Mapper::Types.get_studio_types(generation_id, true)

Dir.mkdir('out') unless Dir.exist?('out')
Dir.mkdir('out/types') unless Dir.exist?('out/types')
Dir['out/types/*.json'].each do |f|
  basename = File.basename(f, '.json').to_sym
  File.delete(f) unless types.find { |t| t[:dbSymbol] == basename }
end

types.each do |t|
  File.write("out/types/#{t[:dbSymbol]}.json", JSON.pretty_generate(t))
end
