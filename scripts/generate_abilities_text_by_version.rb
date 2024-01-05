require 'csv'
require_relative '../lib/index'

if ARGV.size < 1
  puts "USAGE: ruby scripts/generate_abilities_text_by_version.rb VER_ID"
  Mapper.list_versions
  exit
end


PokeAPI::Abilities.load
PokeAPI::Languages.load
PokeAPI::AbilityNames.load
PokeAPI::AbilityFlavorText.load

data = Mapper::Abilities.get_ability_texts(ARGV[0].to_i)

Dir.mkdir('out') unless Dir.exist?('out')
Dir.mkdir('out/Dialogs') unless Dir.exist?('out/Dialogs')
CSV.open('out/Dialogs/100004.csv', 'w') do |csv|
  data[0].each { |row| csv << row }
end
CSV.open('out/Dialogs/100005.csv', 'w') do |csv|
  data[1].each { |row| csv << row }
end