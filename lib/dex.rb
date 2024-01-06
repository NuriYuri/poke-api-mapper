module Mapper
  module Dex
    module_function

    def get_studio_dexes
      return PokeAPI::Pokedexes::DATA.map do |d|
        id = PokeAPI::Pokedexes::DATA.index(d) || 0
        next({
          klass: :Dex,
          id: id,
          dbSymbol: d.identifier,
          csv: {
            csvFileId: 100063,
            csvTextIndex: id
          },
          startId: figure_out_start_id(d.id),
          creatures: get_dex_creatures(d.id)
        })
      end
    end

    # @param id [Integer]
    # @return [Integer]
    def figure_out_start_id(id)
      PokeAPI::PokemonDexNumbers::DATA.select { |n| n.pokedex_id == id }.min_by(&:pokedex_number)&.pokedex_number || 1
    end

    # @param id [Integer]
    # @return [Array<Hash>]
    def get_dex_creatures(id)
      creatures = PokeAPI::PokemonDexNumbers::DATA.select { |n| n.pokedex_id == id }
      creatures.sort_by!(&:pokedex_number)
      return creatures.map do |c|
        # TODO: figure out Pokemon Forms
        sid = c.﻿species_id
        next {
          dbSymbol: PokeAPI::PokemonSpecies::DATA.find { |s| s.id == sid }.identifier || :__undef__,
          form: 0
        }
      end
    end

    def get_dex_texts
      language_ids, header = Mapper.get_languages
      
      return [
        header,
        *PokeAPI::Pokedexes::DATA.map do |d|
          did = d.id
          next language_ids.map do |lid|
            PokeAPI::PokedexProse::DATA.find { |pp| pp.local_language_id == lid && pp.pokedex_id == did }&.name ||
            PokeAPI::PokedexProse::DATA.find { |pp| pp.local_language_id == 9 && pp.pokedex_id == did }&.name || '---'
          end
        end
      ]
    end
  end
end
