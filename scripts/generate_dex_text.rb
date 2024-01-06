require 'csv'
require_relative '../lib/index'

PokeAPI::Pokedexes.load
PokeAPI::Languages.load
PokeAPI::PokedexProse.load

data = Mapper::Dex.get_dex_texts

Dir.mkdir('out') unless Dir.exist?('out')
Dir.mkdir('out/Dialogs') unless Dir.exist?('out/Dialogs')
CSV.open('out/Dialogs/100063.csv', 'w') do |csv|
  data.each { |row| csv << row }
end