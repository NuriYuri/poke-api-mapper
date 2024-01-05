require_relative '../lib/index'

if ARGV.size < 1
  puts "USAGE: ruby scripts/generate_abilities_by_gen.rb GEN_ID [--no-unofficial]"
  Mapper.list_generations
  exit
end

require 'json'

PokeAPI::Abilities.load
generation_id = ARGV[0].to_i

abilities = Mapper::Abilities.get_studio_abilities(generation_id, ARGV.include?('--no-unofficial'), true)

Dir.mkdir('out') unless Dir.exist?('out')
Dir.mkdir('out/abilities') unless Dir.exist?('out/abilities')
Dir['out/abilities/*.json'].each do |f|
  basename = File.basename(f, '.json').to_sym
  File.delete(f) unless abilities.find { |t| t[:dbSymbol] == basename }
end

abilities.each do |t|
  File.write("out/abilities/#{t[:dbSymbol]}.json", JSON.pretty_generate(t))
end
