module Mapper
  module Types
    PSDK_TYPE_IDS = [nil, 1, 7, 10, 8, 9, 13, 12, 14, 16, 2, 3, 5, 4, 11, 6, 15, 17]
    module_function

    # @param generation_id [Integer] ID of the generation we want the type information
    # @param filter_out_newer [Boolean] if we want to filter out newer generation data
    # @return [Array<Hash>]
    def get_studio_types(generation_id, filter_out_newer = false)
      types = PokeAPI::Types::DATA.dup
      types.select! { |t| t.generation_id <= generation_id } if filter_out_newer
      types.reject! { |t| t.identifier == :unknown || t.identifier == :shadow }

      return types.map do |t|
        next({
          klass: :Type,
          id: PSDK_TYPE_IDS[t.id] || t.id,
          dbSymbol: t.identifier,
          textId: PokeAPI::Types::DATA.index(t) || 1,
          damageTo: get_studio_damage_to(t.id, generation_id, types)
        })
      end
    end

    # @param offensive_type_id [Integer]
    # @param generation_id [Integer] ID of the generation we want the type information
    # @param types [Array<PokeAPI::Types>]
    # @return [Array<Hash>]
    def get_studio_damage_to(offensive_type_id, generation_id, types)
      efficacies = PokeAPI::TypeEfficacy::DATA.select { |d| d.damage_type_id == offensive_type_id && types.find { |t| t.id == d.target_type_id } }
      past_efficacies = PokeAPI::TypeEfficacyPast::DATA.select { |d| d.generation_id == generation_id && d.damage_type_id == offensive_type_id && types.find { |t| t.id == d.target_type_id } }
      efficacies.reject! { |d| past_efficacies.find { |t| t.damage_type_id == d.damage_type_id && t.target_type_id == d.target_type_id } }

      return efficacies.concat(past_efficacies).select { |e| e.damage_factor != 100 }.map do |e|
        next({
          defensiveType: types.find { |t| t.id == e.target_type_id }.identifier,
          factor: e.damage_factor / 100.0
        })
      end
    end

    def get_type_texts
      languages = PokeAPI::Languages::DATA.reject { |l| l.id == 2 || l.id > 9 }
      language_ids = languages.map { |l| l.id }
      header = languages.map { |l| l.id == 1 ? 'kana' : l.iso639 }
      return [
        header,
        *PokeAPI::Types::DATA.map do |t|
          tid = t.id
          next language_ids.map { |lid| PokeAPI::TypeNames::DATA.find { |tn| tn.local_language_id == lid && tn.type_id == tid }&.name || '---'}
        end
      ]
    end
  end
end