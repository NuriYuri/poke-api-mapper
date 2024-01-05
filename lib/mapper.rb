module Mapper
  module_function
  
  # @return [Array<Array<Integer>, Array<String>>]
  def get_languages
    languages = PokeAPI::Languages::DATA.reject { |l| l.id == 2 || l.id > 9 }
    language_ids = languages.map { |l| l.id }
    header = languages.map { |l| l.id == 1 ? 'kana' : l.iso639 }

    return language_ids, header
  end

  def list_generations
    PokeAPI::Generations.load
    puts "GEN_ID\tNAME"
    PokeAPI::Generations::DATA.each do |generation|
      puts "#{generation.id}\t#{generation.identifier}"
    end
  end

  def list_versions
    PokeAPI::VersionGroups.load
    puts "VER_ID\tNAME"
    PokeAPI::VersionGroups::DATA.each do |version|
      puts "#{version.id}\t#{version.identifier}"
    end
  end
end