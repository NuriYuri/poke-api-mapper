require 'csv'
require_relative '../lib/index'

PokeAPI::Types.load
PokeAPI::Languages.load
PokeAPI::TypeNames.load

data = Mapper::Types.get_type_texts

Dir.mkdir('out') unless Dir.exist?('out')
Dir.mkdir('out/Dialogs') unless Dir.exist?('out/Dialogs')
CSV.open('out/Dialogs/100003.csv', 'w') do |csv|
  data.each { |row| csv << row }
end