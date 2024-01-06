require_relative '../lib/index'
require 'json'

PokeAPI::Pokedexes.load
PokeAPI::PokemonDexNumbers.load
PokeAPI::PokemonSpecies.load

dexes = Mapper::Dex.get_studio_dexes

Dir.mkdir('out') unless Dir.exist?('out')
Dir.mkdir('out/dex') unless Dir.exist?('out/dex')
Dir['out/dex/*.json'].each do |f|
  basename = File.basename(f, '.json').to_sym
  File.delete(f) unless dexes.find { |t| t[:dbSymbol] == basename }
end

dexes.each do |t|
  File.write("out/dex/#{t[:dbSymbol]}.json", JSON.pretty_generate(t))
end
