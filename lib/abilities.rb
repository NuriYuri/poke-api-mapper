module Mapper
  module Abilities
    PSDK_ABILITY_ID = [nil, 44, 107, 77, 71, 37, 28, 27, 13, 12, 68, 32, 39, 29, 5, 49, 105, 73, 18, 3, 40, 84, 11, 79, 98, 91, 48, 21, 33, 35, 56, 53, 57, 60, 20, 63, 69, 75, 14, 19, 82, 62, 92, 52, 88, 87, 72, 42, 41, 65, 9, 7, 51, 25, 90, 74, 16, 96, 97, 104, 45, 4, 10, 103, 36, 0, 1, 2, 6, 38, 108, 24, 30, 101, 95, 46, 109, 8, 119, 15, 86, 83, 81, 31, 114, 117, 99, 22, 70, 55, 89, 67, 47, 43, 
    76, 80, 93, 61, 17, 34, 94, 26, 58, 116, 66, 78, 115, 102, 50, 110, 23, 64, 120, 59, 113, 106, 100, 118, 111, 85, 54, 122, 112, 121, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 
    172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231]
    
    module_function

    # @param generation_id [Integer] ID of the generation we want the abilities information
    # @param filter_out_unofficial [Boolean] if we want to filter out unofficial abilities
    # @param filter_out_newer [Boolean] if we want to filter out newer generation data
    # @return [Array<Hash>]
    def get_studio_abilities(generation_id, filter_out_unofficial, filter_out_newer = false)
      abilities = PokeAPI::Abilities::DATA.dup
      abilities.select! { |a| a.generation_id <= generation_id } if filter_out_newer
      abilities.select! { |a| a.is_main_series } if filter_out_unofficial

      return abilities.map do |a|
        next({
          klass: :Ability,
          id: PSDK_ABILITY_ID[a.id] || a.id,
          dbSymbol: a.identifier,
          textId: (PokeAPI::Abilities::DATA.index(a) || -1) + 1,
        })
      end
    end

    

    # @param favored_version_group_id [Integer]
    # @return [Array<Array<Array<String>>>]
    def get_ability_texts(favored_version_group_id)
      language_ids, header = Mapper.get_languages

      return [
        [
          header,
          header.map { '---' },
          *PokeAPI::Abilities::DATA.map do |a|
            aid = a.id
            next language_ids.map { |lid| PokeAPI::AbilityNames::DATA.find { |an| an.local_language_id == lid && an.ability_id == aid }&.name || '---'}
          end
        ],
        [
          header,
          header.map { '---' },
          *PokeAPI::Abilities::DATA.map do |a|
            aid = a.id
            next language_ids.map { |lid| (find_ability_description(favored_version_group_id, aid, lid) || '---').gsub("\n", " ").gsub("  ", " ") }
          end
        ]
      ]
    end

    # Try to find the best suitable ability description based on favored_version_group_id
    # @param favored_version_group_id [Integer]
    # @param aid [Integer] ability ID
    # @param lid [Integer] language ID
    # @return [String, nil]
    def find_ability_description(favored_version_group_id, aid, lid)
      related_flavors = PokeAPI::AbilityFlavorText::DATA.select { |af| af.language_id == lid && af.ability_id == aid }
      desired_flavor = related_flavors.find { |af| af.version_group_id == favored_version_group_id }
      return desired_flavor.flavor_text if desired_flavor

      related_flavors.sort_by!(&:version_group_id)
      related_flavors.reverse!

      return (related_flavors.find { |af| af.version_group_id < favored_version_group_id } || related_flavors.last)&.flavor_text
    end
  end
end