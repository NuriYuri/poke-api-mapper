module PokeAPI
  class Abilities
    # @return [Array<Abilities>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :generation_id
    # @return [Boolean]
    attr_reader :is_main_series
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @generation_id = row[2].to_i
      @is_main_series = row[3].to_i == 1
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/abilities.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/abilities.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/abilities.dat', Marshal.dump(DATA))
    end
  end
  class AbilityChangelog
    # @return [Array<AbilityChangelog>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :ability_id
    # @return [Integer]
    attr_reader :changed_in_version_group_id
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @ability_id = row[1].to_i
      @changed_in_version_group_id = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/ability_changelog.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/ability_changelog.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/ability_changelog.dat', Marshal.dump(DATA))
    end
  end
  class AbilityChangelogProse
    # @return [Array<AbilityChangelogProse>]
    DATA = []
    # @return [Integer]
    attr_reader :ability_changelog_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :effect
    # @param row [Array]
    def initialize(row)
      @ability_changelog_id = row[0].to_i
      @local_language_id = row[1].to_i
      @effect = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/ability_changelog_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/ability_changelog_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/ability_changelog_prose.dat', Marshal.dump(DATA))
    end
  end
  class AbilityFlavorText
    # @return [Array<AbilityFlavorText>]
    DATA = []
    # @return [Integer]
    attr_reader :ability_id
    # @return [Integer]
    attr_reader :version_group_id
    # @return [Integer]
    attr_reader :language_id
    # @return [String]
    attr_reader :flavor_text
    # @param row [Array]
    def initialize(row)
      @ability_id = row[0].to_i
      @version_group_id = row[1].to_i
      @language_id = row[2].to_i
      @flavor_text = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/ability_flavor_text.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/ability_flavor_text.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/ability_flavor_text.dat', Marshal.dump(DATA))
    end
  end
  class AbilityNames
    # @return [Array<AbilityNames>]
    DATA = []
    # @return [Integer]
    attr_reader :ability_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @ability_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/ability_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/ability_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/ability_names.dat', Marshal.dump(DATA))
    end
  end
  class AbilityProse
    # @return [Array<AbilityProse>]
    DATA = []
    # @return [Integer]
    attr_reader :ability_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :short_effect
    # @return [String]
    attr_reader :effect
    # @param row [Array]
    def initialize(row)
      @ability_id = row[0].to_i
      @local_language_id = row[1].to_i
      @short_effect = row[2].to_s
      @effect = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/ability_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/ability_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/ability_prose.dat', Marshal.dump(DATA))
    end
  end
  class Berries
    # @return [Array<Berries>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :item_id
    # @return [Integer]
    attr_reader :firmness_id
    # @return [Integer]
    attr_reader :natural_gift_power
    # @return [Integer]
    attr_reader :natural_gift_type_id
    # @return [Integer]
    attr_reader :size
    # @return [Integer]
    attr_reader :max_harvest
    # @return [Integer]
    attr_reader :growth_time
    # @return [Integer]
    attr_reader :soil_dryness
    # @return [Integer]
    attr_reader :smoothness
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @item_id = row[1].to_i
      @firmness_id = row[2].to_i
      @natural_gift_power = row[3].to_i
      @natural_gift_type_id = row[4].to_i
      @size = row[5].to_i
      @max_harvest = row[6].to_i
      @growth_time = row[7].to_i
      @soil_dryness = row[8].to_i
      @smoothness = row[9].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/berries.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/berries.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/berries.dat', Marshal.dump(DATA))
    end
  end
  class BerryFirmness
    # @return [Array<BerryFirmness>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/berry_firmness.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/berry_firmness.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/berry_firmness.dat', Marshal.dump(DATA))
    end
  end
  class BerryFirmnessNames
    # @return [Array<BerryFirmnessNames>]
    DATA = []
    # @return [Integer]
    attr_reader :berry_firmness_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @berry_firmness_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/berry_firmness_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/berry_firmness_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/berry_firmness_names.dat', Marshal.dump(DATA))
    end
  end
  class BerryFlavors
    # @return [Array<BerryFlavors>]
    DATA = []
    # @return [Integer]
    attr_reader :berry_id
    # @return [Integer]
    attr_reader :contest_type_id
    # @return [Integer]
    attr_reader :flavor
    # @param row [Array]
    def initialize(row)
      @berry_id = row[0].to_i
      @contest_type_id = row[1].to_i
      @flavor = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/berry_flavors.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/berry_flavors.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/berry_flavors.dat', Marshal.dump(DATA))
    end
  end
  class CharacteristicText
    # @return [Array<CharacteristicText>]
    DATA = []
    # @return [Integer]
    attr_reader :characteristic_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :message
    # @param row [Array]
    def initialize(row)
      @characteristic_id = row[0].to_i
      @local_language_id = row[1].to_i
      @message = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/characteristic_text.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/characteristic_text.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/characteristic_text.dat', Marshal.dump(DATA))
    end
  end
  class Characteristics
    # @return [Array<Characteristics>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :stat_id
    # @return [Integer]
    attr_reader :gene_mod_5
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @stat_id = row[1].to_i
      @gene_mod_5 = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/characteristics.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/characteristics.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/characteristics.dat', Marshal.dump(DATA))
    end
  end
  class ConquestEpisodeNames
    # @return [Array<ConquestEpisodeNames>]
    DATA = []
    # @return [Integer]
    attr_reader :episode_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @episode_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_episode_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_episode_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_episode_names.dat', Marshal.dump(DATA))
    end
  end
  class ConquestEpisodeWarriors
    # @return [Array<ConquestEpisodeWarriors>]
    DATA = []
    # @return [Integer]
    attr_reader :episode_id
    # @return [Integer]
    attr_reader :warrior_id
    # @param row [Array]
    def initialize(row)
      @episode_id = row[0].to_i
      @warrior_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_episode_warriors.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_episode_warriors.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_episode_warriors.dat', Marshal.dump(DATA))
    end
  end
  class ConquestEpisodes
    # @return [Array<ConquestEpisodes>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_episodes.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_episodes.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_episodes.dat', Marshal.dump(DATA))
    end
  end
  class ConquestKingdomNames
    # @return [Array<ConquestKingdomNames>]
    DATA = []
    # @return [Integer]
    attr_reader :kingdom_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @kingdom_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_kingdom_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_kingdom_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_kingdom_names.dat', Marshal.dump(DATA))
    end
  end
  class ConquestKingdoms
    # @return [Array<ConquestKingdoms>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :type_id
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @type_id = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_kingdoms.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_kingdoms.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_kingdoms.dat', Marshal.dump(DATA))
    end
  end
  class ConquestMaxLinks
    # @return [Array<ConquestMaxLinks>]
    DATA = []
    # @return [Integer]
    attr_reader :warrior_rank_id
    # @return [Integer]
    attr_reader :pokemon_species_id
    # @return [Integer]
    attr_reader :max_link
    # @param row [Array]
    def initialize(row)
      @warrior_rank_id = row[0].to_i
      @pokemon_species_id = row[1].to_i
      @max_link = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_max_links.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_max_links.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_max_links.dat', Marshal.dump(DATA))
    end
  end
  class ConquestMoveData
    # @return [Array<ConquestMoveData>]
    DATA = []
    # @return [Integer]
    attr_reader :move_id
    # @return [Integer]
    attr_reader :power
    # @return [Integer]
    attr_reader :accuracy
    # @return [String]
    attr_reader :effect_chance
    # @return [Integer]
    attr_reader :effect_id
    # @return [Integer]
    attr_reader :range_id
    # @return [Integer]
    attr_reader :displacement_id
    # @param row [Array]
    def initialize(row)
      @move_id = row[0].to_i
      @power = row[1].to_i
      @accuracy = row[2].to_i
      @effect_chance = row[3].to_s
      @effect_id = row[4].to_i
      @range_id = row[5].to_i
      @displacement_id = row[6].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_move_data.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_move_data.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_move_data.dat', Marshal.dump(DATA))
    end
  end
  class ConquestMoveDisplacementProse
    # @return [Array<ConquestMoveDisplacementProse>]
    DATA = []
    # @return [Integer]
    attr_reader :move_displacement_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :short_effect
    # @return [String]
    attr_reader :effect
    # @param row [Array]
    def initialize(row)
      @move_displacement_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
      @short_effect = row[3].to_s
      @effect = row[4].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_move_displacement_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_move_displacement_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_move_displacement_prose.dat', Marshal.dump(DATA))
    end
  end
  class ConquestMoveDisplacements
    # @return [Array<ConquestMoveDisplacements>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :affects_target
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @affects_target = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_move_displacements.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_move_displacements.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_move_displacements.dat', Marshal.dump(DATA))
    end
  end
  class ConquestMoveEffectProse
    # @return [Array<ConquestMoveEffectProse>]
    DATA = []
    # @return [Integer]
    attr_reader :conquest_move_effect_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :short_effect
    # @return [String]
    attr_reader :effect
    # @param row [Array]
    def initialize(row)
      @conquest_move_effect_id = row[0].to_i
      @local_language_id = row[1].to_i
      @short_effect = row[2].to_s
      @effect = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_move_effect_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_move_effect_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_move_effect_prose.dat', Marshal.dump(DATA))
    end
  end
  class ConquestMoveEffects
    # @return [Array<ConquestMoveEffects>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_move_effects.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_move_effects.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_move_effects.dat', Marshal.dump(DATA))
    end
  end
  class ConquestMoveRangeProse
    # @return [Array<ConquestMoveRangeProse>]
    DATA = []
    # @return [Integer]
    attr_reader :conquest_move_range_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :description
    # @param row [Array]
    def initialize(row)
      @conquest_move_range_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
      @description = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_move_range_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_move_range_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_move_range_prose.dat', Marshal.dump(DATA))
    end
  end
  class ConquestMoveRanges
    # @return [Array<ConquestMoveRanges>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :targets
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @targets = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_move_ranges.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_move_ranges.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_move_ranges.dat', Marshal.dump(DATA))
    end
  end
  class ConquestPokemonAbilities
    # @return [Array<ConquestPokemonAbilities>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_species_id
    # @return [Integer]
    attr_reader :slot
    # @return [Integer]
    attr_reader :ability_id
    # @param row [Array]
    def initialize(row)
      @pokemon_species_id = row[0].to_i
      @slot = row[1].to_i
      @ability_id = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_pokemon_abilities.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_pokemon_abilities.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_pokemon_abilities.dat', Marshal.dump(DATA))
    end
  end
  class ConquestPokemonEvolution
    # @return [Array<ConquestPokemonEvolution>]
    DATA = []
    # @return [Integer]
    attr_reader :evolved_species_id
    # @return [Integer]
    attr_reader :required_stat_id
    # @return [Integer]
    attr_reader :minimum_stat
    # @return [String]
    attr_reader :minimum_link
    # @return [Integer]
    attr_reader :kingdom_id
    # @return [Integer]
    attr_reader :warrior_gender_id
    # @return [Integer]
    attr_reader :item_id
    # @return [Integer]
    attr_reader :recruiting_ko_required
    # @param row [Array]
    def initialize(row)
      @evolved_species_id = row[0].to_i
      @required_stat_id = row[1].to_i
      @minimum_stat = row[2].to_i
      @minimum_link = row[3].to_s
      @kingdom_id = row[4].to_i
      @warrior_gender_id = row[5].to_i
      @item_id = row[6].to_i
      @recruiting_ko_required = row[7].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_pokemon_evolution.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_pokemon_evolution.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_pokemon_evolution.dat', Marshal.dump(DATA))
    end
  end
  class ConquestPokemonMoves
    # @return [Array<ConquestPokemonMoves>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_species_id
    # @return [Integer]
    attr_reader :move_id
    # @param row [Array]
    def initialize(row)
      @pokemon_species_id = row[0].to_i
      @move_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_pokemon_moves.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_pokemon_moves.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_pokemon_moves.dat', Marshal.dump(DATA))
    end
  end
  class ConquestPokemonStats
    # @return [Array<ConquestPokemonStats>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_species_id
    # @return [Integer]
    attr_reader :conquest_stat_id
    # @return [Integer]
    attr_reader :base_stat
    # @param row [Array]
    def initialize(row)
      @pokemon_species_id = row[0].to_i
      @conquest_stat_id = row[1].to_i
      @base_stat = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_pokemon_stats.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_pokemon_stats.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_pokemon_stats.dat', Marshal.dump(DATA))
    end
  end
  class ConquestStatNames
    # @return [Array<ConquestStatNames>]
    DATA = []
    # @return [Integer]
    attr_reader :conquest_stat_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @conquest_stat_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_stat_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_stat_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_stat_names.dat', Marshal.dump(DATA))
    end
  end
  class ConquestStats
    # @return [Array<ConquestStats>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Boolean]
    attr_reader :is_base
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @is_base = row[2].to_i == 1
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_stats.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_stats.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_stats.dat', Marshal.dump(DATA))
    end
  end
  class ConquestTransformationPokemon
    # @return [Array<ConquestTransformationPokemon>]
    DATA = []
    # @return [Integer]
    attr_reader :transformation_id
    # @return [Integer]
    attr_reader :pokemon_species_id
    # @param row [Array]
    def initialize(row)
      @transformation_id = row[0].to_i
      @pokemon_species_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_transformation_pokemon.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_transformation_pokemon.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_transformation_pokemon.dat', Marshal.dump(DATA))
    end
  end
  class ConquestTransformationWarriors
    # @return [Array<ConquestTransformationWarriors>]
    DATA = []
    # @return [Integer]
    attr_reader :transformation_id
    # @return [Integer]
    attr_reader :present_warrior_id
    # @param row [Array]
    def initialize(row)
      @transformation_id = row[0].to_i
      @present_warrior_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_transformation_warriors.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_transformation_warriors.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_transformation_warriors.dat', Marshal.dump(DATA))
    end
  end
  class ConquestWarriorArchetypes
    # @return [Array<ConquestWarriorArchetypes>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_warrior_archetypes.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_warrior_archetypes.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_warrior_archetypes.dat', Marshal.dump(DATA))
    end
  end
  class ConquestWarriorNames
    # @return [Array<ConquestWarriorNames>]
    DATA = []
    # @return [Integer]
    attr_reader :warrior_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @warrior_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_warrior_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_warrior_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_warrior_names.dat', Marshal.dump(DATA))
    end
  end
  class ConquestWarriorRankStatMap
    # @return [Array<ConquestWarriorRankStatMap>]
    DATA = []
    # @return [Integer]
    attr_reader :warrior_rank_id
    # @return [Integer]
    attr_reader :warrior_stat_id
    # @return [Integer]
    attr_reader :base_stat
    # @param row [Array]
    def initialize(row)
      @warrior_rank_id = row[0].to_i
      @warrior_stat_id = row[1].to_i
      @base_stat = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_warrior_rank_stat_map.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_warrior_rank_stat_map.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_warrior_rank_stat_map.dat', Marshal.dump(DATA))
    end
  end
  class ConquestWarriorRanks
    # @return [Array<ConquestWarriorRanks>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :warrior_id
    # @return [Integer]
    attr_reader :rank
    # @return [Integer]
    attr_reader :skill_id
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @warrior_id = row[1].to_i
      @rank = row[2].to_i
      @skill_id = row[3].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_warrior_ranks.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_warrior_ranks.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_warrior_ranks.dat', Marshal.dump(DATA))
    end
  end
  class ConquestWarriorSkillNames
    # @return [Array<ConquestWarriorSkillNames>]
    DATA = []
    # @return [Integer]
    attr_reader :skill_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @skill_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_warrior_skill_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_warrior_skill_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_warrior_skill_names.dat', Marshal.dump(DATA))
    end
  end
  class ConquestWarriorSkills
    # @return [Array<ConquestWarriorSkills>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_warrior_skills.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_warrior_skills.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_warrior_skills.dat', Marshal.dump(DATA))
    end
  end
  class ConquestWarriorSpecialties
    # @return [Array<ConquestWarriorSpecialties>]
    DATA = []
    # @return [Integer]
    attr_reader :warrior_id
    # @return [Integer]
    attr_reader :type_id
    # @return [Integer]
    attr_reader :slot
    # @param row [Array]
    def initialize(row)
      @warrior_id = row[0].to_i
      @type_id = row[1].to_i
      @slot = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_warrior_specialties.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_warrior_specialties.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_warrior_specialties.dat', Marshal.dump(DATA))
    end
  end
  class ConquestWarriorStatNames
    # @return [Array<ConquestWarriorStatNames>]
    DATA = []
    # @return [Integer]
    attr_reader :warrior_stat_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @warrior_stat_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_warrior_stat_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_warrior_stat_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_warrior_stat_names.dat', Marshal.dump(DATA))
    end
  end
  class ConquestWarriorStats
    # @return [Array<ConquestWarriorStats>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_warrior_stats.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_warrior_stats.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_warrior_stats.dat', Marshal.dump(DATA))
    end
  end
  class ConquestWarriorTransformation
    # @return [Array<ConquestWarriorTransformation>]
    DATA = []
    # @return [Integer]
    attr_reader :transformed_warrior_rank_id
    # @return [Boolean]
    attr_reader :is_automatic
    # @return [String]
    attr_reader :required_link
    # @return [Integer]
    attr_reader :completed_episode_id
    # @return [Integer]
    attr_reader :current_episode_id
    # @return [Integer]
    attr_reader :distant_warrior_id
    # @return [String]
    attr_reader :female_warlord_count
    # @return [String]
    attr_reader :pokemon_count
    # @return [Integer]
    attr_reader :collection_type_id
    # @return [String]
    attr_reader :warrior_count
    # @param row [Array]
    def initialize(row)
      @transformed_warrior_rank_id = row[0].to_i
      @is_automatic = row[1].to_i == 1
      @required_link = row[2].to_s
      @completed_episode_id = row[3].to_i
      @current_episode_id = row[4].to_i
      @distant_warrior_id = row[5].to_i
      @female_warlord_count = row[6].to_s
      @pokemon_count = row[7].to_s
      @collection_type_id = row[8].to_i
      @warrior_count = row[9].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_warrior_transformation.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_warrior_transformation.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_warrior_transformation.dat', Marshal.dump(DATA))
    end
  end
  class ConquestWarriors
    # @return [Array<ConquestWarriors>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :gender_id
    # @return [Integer]
    attr_reader :archetype_id
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @gender_id = row[2].to_i
      @archetype_id = row[3].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/conquest_warriors.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/conquest_warriors.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/conquest_warriors.dat', Marshal.dump(DATA))
    end
  end
  class ContestCombos
    # @return [Array<ContestCombos>]
    DATA = []
    # @return [Integer]
    attr_reader :first_move_id
    # @return [Integer]
    attr_reader :second_move_id
    # @param row [Array]
    def initialize(row)
      @first_move_id = row[0].to_i
      @second_move_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/contest_combos.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/contest_combos.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/contest_combos.dat', Marshal.dump(DATA))
    end
  end
  class ContestEffectProse
    # @return [Array<ContestEffectProse>]
    DATA = []
    # @return [Integer]
    attr_reader :contest_effect_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :flavor_text
    # @return [String]
    attr_reader :effect
    # @param row [Array]
    def initialize(row)
      @contest_effect_id = row[0].to_i
      @local_language_id = row[1].to_i
      @flavor_text = row[2].to_s
      @effect = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/contest_effect_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/contest_effect_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/contest_effect_prose.dat', Marshal.dump(DATA))
    end
  end
  class ContestEffects
    # @return [Array<ContestEffects>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :appeal
    # @return [Integer]
    attr_reader :jam
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @appeal = row[1].to_i
      @jam = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/contest_effects.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/contest_effects.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/contest_effects.dat', Marshal.dump(DATA))
    end
  end
  class ContestTypeNames
    # @return [Array<ContestTypeNames>]
    DATA = []
    # @return [Integer]
    attr_reader :contest_type_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :flavor
    # @return [String]
    attr_reader :color
    # @param row [Array]
    def initialize(row)
      @contest_type_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
      @flavor = row[3].to_s
      @color = row[4].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/contest_type_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/contest_type_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/contest_type_names.dat', Marshal.dump(DATA))
    end
  end
  class ContestTypes
    # @return [Array<ContestTypes>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/contest_types.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/contest_types.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/contest_types.dat', Marshal.dump(DATA))
    end
  end
  class EggGroupProse
    # @return [Array<EggGroupProse>]
    DATA = []
    # @return [Integer]
    attr_reader :egg_group_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @egg_group_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/egg_group_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/egg_group_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/egg_group_prose.dat', Marshal.dump(DATA))
    end
  end
  class EggGroups
    # @return [Array<EggGroups>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/egg_groups.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/egg_groups.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/egg_groups.dat', Marshal.dump(DATA))
    end
  end
  class EncounterConditionProse
    # @return [Array<EncounterConditionProse>]
    DATA = []
    # @return [Integer]
    attr_reader :encounter_condition_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @encounter_condition_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/encounter_condition_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/encounter_condition_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/encounter_condition_prose.dat', Marshal.dump(DATA))
    end
  end
  class EncounterConditionValueMap
    # @return [Array<EncounterConditionValueMap>]
    DATA = []
    # @return [Integer]
    attr_reader :encounter_id
    # @return [Integer]
    attr_reader :encounter_condition_value_id
    # @param row [Array]
    def initialize(row)
      @encounter_id = row[0].to_i
      @encounter_condition_value_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/encounter_condition_value_map.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/encounter_condition_value_map.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/encounter_condition_value_map.dat', Marshal.dump(DATA))
    end
  end
  class EncounterConditionValueProse
    # @return [Array<EncounterConditionValueProse>]
    DATA = []
    # @return [Integer]
    attr_reader :encounter_condition_value_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @encounter_condition_value_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/encounter_condition_value_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/encounter_condition_value_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/encounter_condition_value_prose.dat', Marshal.dump(DATA))
    end
  end
  class EncounterConditionValues
    # @return [Array<EncounterConditionValues>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :encounter_condition_id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Boolean]
    attr_reader :is_default
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @encounter_condition_id = row[1].to_i
      @identifier = row[2].to_s.gsub(/[^a-z_]/, '_').to_sym
      @is_default = row[3].to_i == 1
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/encounter_condition_values.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/encounter_condition_values.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/encounter_condition_values.dat', Marshal.dump(DATA))
    end
  end
  class EncounterConditions
    # @return [Array<EncounterConditions>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/encounter_conditions.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/encounter_conditions.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/encounter_conditions.dat', Marshal.dump(DATA))
    end
  end
  class EncounterMethodProse
    # @return [Array<EncounterMethodProse>]
    DATA = []
    # @return [Integer]
    attr_reader :encounter_method_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @encounter_method_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/encounter_method_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/encounter_method_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/encounter_method_prose.dat', Marshal.dump(DATA))
    end
  end
  class EncounterMethods
    # @return [Array<EncounterMethods>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :order
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @order = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/encounter_methods.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/encounter_methods.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/encounter_methods.dat', Marshal.dump(DATA))
    end
  end
  class EncounterSlots
    # @return [Array<EncounterSlots>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :version_group_id
    # @return [Integer]
    attr_reader :encounter_method_id
    # @return [Integer]
    attr_reader :slot
    # @return [Integer]
    attr_reader :rarity
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @version_group_id = row[1].to_i
      @encounter_method_id = row[2].to_i
      @slot = row[3].to_i
      @rarity = row[4].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/encounter_slots.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/encounter_slots.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/encounter_slots.dat', Marshal.dump(DATA))
    end
  end
  class Encounters
    # @return [Array<Encounters>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :version_id
    # @return [Integer]
    attr_reader :location_area_id
    # @return [Integer]
    attr_reader :encounter_slot_id
    # @return [Integer]
    attr_reader :pokemon_id
    # @return [Integer]
    attr_reader :min_level
    # @return [Integer]
    attr_reader :max_level
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @version_id = row[1].to_i
      @location_area_id = row[2].to_i
      @encounter_slot_id = row[3].to_i
      @pokemon_id = row[4].to_i
      @min_level = row[5].to_i
      @max_level = row[6].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/encounters.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/encounters.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/encounters.dat', Marshal.dump(DATA))
    end
  end
  class EvolutionChains
    # @return [Array<EvolutionChains>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :baby_trigger_item_id
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @baby_trigger_item_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/evolution_chains.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/evolution_chains.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/evolution_chains.dat', Marshal.dump(DATA))
    end
  end
  class EvolutionTriggerProse
    # @return [Array<EvolutionTriggerProse>]
    DATA = []
    # @return [Integer]
    attr_reader :evolution_trigger_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @evolution_trigger_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/evolution_trigger_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/evolution_trigger_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/evolution_trigger_prose.dat', Marshal.dump(DATA))
    end
  end
  class EvolutionTriggers
    # @return [Array<EvolutionTriggers>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/evolution_triggers.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/evolution_triggers.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/evolution_triggers.dat', Marshal.dump(DATA))
    end
  end
  class Experience
    # @return [Array<Experience>]
    DATA = []
    # @return [Integer]
    attr_reader :growth_rate_id
    # @return [Integer]
    attr_reader :level
    # @return [Integer]
    attr_reader :experience
    # @param row [Array]
    def initialize(row)
      @growth_rate_id = row[0].to_i
      @level = row[1].to_i
      @experience = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/experience.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/experience.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/experience.dat', Marshal.dump(DATA))
    end
  end
  class Genders
    # @return [Array<Genders>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/genders.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/genders.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/genders.dat', Marshal.dump(DATA))
    end
  end
  class GenerationNames
    # @return [Array<GenerationNames>]
    DATA = []
    # @return [Integer]
    attr_reader :generation_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @generation_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/generation_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/generation_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/generation_names.dat', Marshal.dump(DATA))
    end
  end
  class Generations
    # @return [Array<Generations>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :main_region_id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @main_region_id = row[1].to_i
      @identifier = row[2].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/generations.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/generations.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/generations.dat', Marshal.dump(DATA))
    end
  end
  class GrowthRateProse
    # @return [Array<GrowthRateProse>]
    DATA = []
    # @return [Integer]
    attr_reader :growth_rate_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @growth_rate_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/growth_rate_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/growth_rate_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/growth_rate_prose.dat', Marshal.dump(DATA))
    end
  end
  class GrowthRates
    # @return [Array<GrowthRates>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [String]
    attr_reader :formula
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @formula = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/growth_rates.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/growth_rates.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/growth_rates.dat', Marshal.dump(DATA))
    end
  end
  class ItemCategories
    # @return [Array<ItemCategories>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :pocket_id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @pocket_id = row[1].to_i
      @identifier = row[2].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_categories.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_categories.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_categories.dat', Marshal.dump(DATA))
    end
  end
  class ItemCategoryProse
    # @return [Array<ItemCategoryProse>]
    DATA = []
    # @return [Integer]
    attr_reader :item_category_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @item_category_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_category_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_category_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_category_prose.dat', Marshal.dump(DATA))
    end
  end
  class ItemFlagMap
    # @return [Array<ItemFlagMap>]
    DATA = []
    # @return [Integer]
    attr_reader :item_id
    # @return [Integer]
    attr_reader :item_flag_id
    # @param row [Array]
    def initialize(row)
      @item_id = row[0].to_i
      @item_flag_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_flag_map.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_flag_map.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_flag_map.dat', Marshal.dump(DATA))
    end
  end
  class ItemFlagProse
    # @return [Array<ItemFlagProse>]
    DATA = []
    # @return [Integer]
    attr_reader :item_flag_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :description
    # @param row [Array]
    def initialize(row)
      @item_flag_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
      @description = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_flag_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_flag_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_flag_prose.dat', Marshal.dump(DATA))
    end
  end
  class ItemFlags
    # @return [Array<ItemFlags>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_flags.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_flags.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_flags.dat', Marshal.dump(DATA))
    end
  end
  class ItemFlavorSummaries
    # @return [Array<ItemFlavorSummaries>]
    DATA = []
    # @return [Integer]
    attr_reader :item_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :flavor_summary
    # @param row [Array]
    def initialize(row)
      @item_id = row[0].to_i
      @local_language_id = row[1].to_i
      @flavor_summary = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_flavor_summaries.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_flavor_summaries.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_flavor_summaries.dat', Marshal.dump(DATA))
    end
  end
  class ItemFlavorText
    # @return [Array<ItemFlavorText>]
    DATA = []
    # @return [Integer]
    attr_reader :item_id
    # @return [Integer]
    attr_reader :version_group_id
    # @return [Integer]
    attr_reader :language_id
    # @return [String]
    attr_reader :flavor_text
    # @param row [Array]
    def initialize(row)
      @item_id = row[0].to_i
      @version_group_id = row[1].to_i
      @language_id = row[2].to_i
      @flavor_text = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_flavor_text.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_flavor_text.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_flavor_text.dat', Marshal.dump(DATA))
    end
  end
  class ItemFlingEffectProse
    # @return [Array<ItemFlingEffectProse>]
    DATA = []
    # @return [Integer]
    attr_reader :item_fling_effect_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :effect
    # @param row [Array]
    def initialize(row)
      @item_fling_effect_id = row[0].to_i
      @local_language_id = row[1].to_i
      @effect = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_fling_effect_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_fling_effect_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_fling_effect_prose.dat', Marshal.dump(DATA))
    end
  end
  class ItemFlingEffects
    # @return [Array<ItemFlingEffects>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_fling_effects.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_fling_effects.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_fling_effects.dat', Marshal.dump(DATA))
    end
  end
  class ItemGameIndices
    # @return [Array<ItemGameIndices>]
    DATA = []
    # @return [Integer]
    attr_reader :item_id
    # @return [Integer]
    attr_reader :generation_id
    # @return [Integer]
    attr_reader :game_index
    # @param row [Array]
    def initialize(row)
      @item_id = row[0].to_i
      @generation_id = row[1].to_i
      @game_index = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_game_indices.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_game_indices.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_game_indices.dat', Marshal.dump(DATA))
    end
  end
  class ItemNames
    # @return [Array<ItemNames>]
    DATA = []
    # @return [Integer]
    attr_reader :item_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @item_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_names.dat', Marshal.dump(DATA))
    end
  end
  class ItemPocketNames
    # @return [Array<ItemPocketNames>]
    DATA = []
    # @return [Integer]
    attr_reader :item_pocket_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @item_pocket_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_pocket_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_pocket_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_pocket_names.dat', Marshal.dump(DATA))
    end
  end
  class ItemPockets
    # @return [Array<ItemPockets>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_pockets.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_pockets.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_pockets.dat', Marshal.dump(DATA))
    end
  end
  class ItemProse
    # @return [Array<ItemProse>]
    DATA = []
    # @return [Integer]
    attr_reader :item_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :short_effect
    # @return [String]
    attr_reader :effect
    # @param row [Array]
    def initialize(row)
      @item_id = row[0].to_i
      @local_language_id = row[1].to_i
      @short_effect = row[2].to_s
      @effect = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/item_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/item_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/item_prose.dat', Marshal.dump(DATA))
    end
  end
  class Items
    # @return [Array<Items>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :category_id
    # @return [Integer]
    attr_reader :cost
    # @return [String]
    attr_reader :fling_power
    # @return [Integer]
    attr_reader :fling_effect_id
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @category_id = row[2].to_i
      @cost = row[3].to_i
      @fling_power = row[4].to_s
      @fling_effect_id = row[5].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/items.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/items.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/items.dat', Marshal.dump(DATA))
    end
  end
  class LanguageNames
    # @return [Array<LanguageNames>]
    DATA = []
    # @return [Integer]
    attr_reader :language_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @language_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/language_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/language_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/language_names.dat', Marshal.dump(DATA))
    end
  end
  class Languages
    # @return [Array<Languages>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [String]
    attr_reader :iso639
    # @return [String]
    attr_reader :iso3166
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :official
    # @return [Integer]
    attr_reader :order
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @iso639 = row[1].to_s
      @iso3166 = row[2].to_s
      @identifier = row[3].to_s.gsub(/[^a-z_]/, '_').to_sym
      @official = row[4].to_i
      @order = row[5].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/languages.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/languages.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/languages.dat', Marshal.dump(DATA))
    end
  end
  class LocationAreaEncounterRates
    # @return [Array<LocationAreaEncounterRates>]
    DATA = []
    # @return [Integer]
    attr_reader :location_area_id
    # @return [Integer]
    attr_reader :encounter_method_id
    # @return [Integer]
    attr_reader :version_id
    # @return [Integer]
    attr_reader :rate
    # @param row [Array]
    def initialize(row)
      @location_area_id = row[0].to_i
      @encounter_method_id = row[1].to_i
      @version_id = row[2].to_i
      @rate = row[3].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/location_area_encounter_rates.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/location_area_encounter_rates.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/location_area_encounter_rates.dat', Marshal.dump(DATA))
    end
  end
  class LocationAreaProse
    # @return [Array<LocationAreaProse>]
    DATA = []
    # @return [Integer]
    attr_reader :location_area_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @location_area_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/location_area_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/location_area_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/location_area_prose.dat', Marshal.dump(DATA))
    end
  end
  class LocationAreas
    # @return [Array<LocationAreas>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :location_id
    # @return [Integer]
    attr_reader :game_index
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @location_id = row[1].to_i
      @game_index = row[2].to_i
      @identifier = row[3].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/location_areas.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/location_areas.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/location_areas.dat', Marshal.dump(DATA))
    end
  end
  class LocationGameIndices
    # @return [Array<LocationGameIndices>]
    DATA = []
    # @return [Integer]
    attr_reader :location_id
    # @return [Integer]
    attr_reader :generation_id
    # @return [Integer]
    attr_reader :game_index
    # @param row [Array]
    def initialize(row)
      @location_id = row[0].to_i
      @generation_id = row[1].to_i
      @game_index = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/location_game_indices.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/location_game_indices.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/location_game_indices.dat', Marshal.dump(DATA))
    end
  end
  class LocationNames
    # @return [Array<LocationNames>]
    DATA = []
    # @return [Integer]
    attr_reader :location_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :subtitle
    # @param row [Array]
    def initialize(row)
      @location_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
      @subtitle = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/location_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/location_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/location_names.dat', Marshal.dump(DATA))
    end
  end
  class Locations
    # @return [Array<Locations>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :region_id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @region_id = row[1].to_i
      @identifier = row[2].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/locations.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/locations.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/locations.dat', Marshal.dump(DATA))
    end
  end
  class Machines
    # @return [Array<Machines>]
    DATA = []
    # @return [Integer]
    attr_reader :machine_number
    # @return [Integer]
    attr_reader :version_group_id
    # @return [Integer]
    attr_reader :item_id
    # @return [Integer]
    attr_reader :move_id
    # @param row [Array]
    def initialize(row)
      @machine_number = row[0].to_i
      @version_group_id = row[1].to_i
      @item_id = row[2].to_i
      @move_id = row[3].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/machines.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/machines.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/machines.dat', Marshal.dump(DATA))
    end
  end
  class MoveBattleStyleProse
    # @return [Array<MoveBattleStyleProse>]
    DATA = []
    # @return [Integer]
    attr_reader :move_battle_style_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @move_battle_style_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_battle_style_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_battle_style_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_battle_style_prose.dat', Marshal.dump(DATA))
    end
  end
  class MoveBattleStyles
    # @return [Array<MoveBattleStyles>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_battle_styles.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_battle_styles.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_battle_styles.dat', Marshal.dump(DATA))
    end
  end
  class MoveChangelog
    # @return [Array<MoveChangelog>]
    DATA = []
    # @return [Integer]
    attr_reader :move_id
    # @return [Integer]
    attr_reader :changed_in_version_group_id
    # @return [Integer]
    attr_reader :type_id
    # @return [String]
    attr_reader :power
    # @return [String]
    attr_reader :pp
    # @return [String]
    attr_reader :accuracy
    # @return [String]
    attr_reader :priority
    # @return [Integer]
    attr_reader :target_id
    # @return [Integer]
    attr_reader :effect_id
    # @return [String]
    attr_reader :effect_chance
    # @param row [Array]
    def initialize(row)
      @move_id = row[0].to_i
      @changed_in_version_group_id = row[1].to_i
      @type_id = row[2].to_i
      @power = row[3].to_s
      @pp = row[4].to_s
      @accuracy = row[5].to_s
      @priority = row[6].to_s
      @target_id = row[7].to_i
      @effect_id = row[8].to_i
      @effect_chance = row[9].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_changelog.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_changelog.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_changelog.dat', Marshal.dump(DATA))
    end
  end
  class MoveDamageClassProse
    # @return [Array<MoveDamageClassProse>]
    DATA = []
    # @return [Integer]
    attr_reader :move_damage_class_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :description
    # @param row [Array]
    def initialize(row)
      @move_damage_class_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
      @description = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_damage_class_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_damage_class_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_damage_class_prose.dat', Marshal.dump(DATA))
    end
  end
  class MoveDamageClasses
    # @return [Array<MoveDamageClasses>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_damage_classes.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_damage_classes.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_damage_classes.dat', Marshal.dump(DATA))
    end
  end
  class MoveEffectChangelog
    # @return [Array<MoveEffectChangelog>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :effect_id
    # @return [Integer]
    attr_reader :changed_in_version_group_id
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @effect_id = row[1].to_i
      @changed_in_version_group_id = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_effect_changelog.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_effect_changelog.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_effect_changelog.dat', Marshal.dump(DATA))
    end
  end
  class MoveEffectChangelogProse
    # @return [Array<MoveEffectChangelogProse>]
    DATA = []
    # @return [Integer]
    attr_reader :move_effect_changelog_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :effect
    # @param row [Array]
    def initialize(row)
      @move_effect_changelog_id = row[0].to_i
      @local_language_id = row[1].to_i
      @effect = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_effect_changelog_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_effect_changelog_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_effect_changelog_prose.dat', Marshal.dump(DATA))
    end
  end
  class MoveEffectProse
    # @return [Array<MoveEffectProse>]
    DATA = []
    # @return [Integer]
    attr_reader :move_effect_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :short_effect
    # @return [String]
    attr_reader :effect
    # @param row [Array]
    def initialize(row)
      @move_effect_id = row[0].to_i
      @local_language_id = row[1].to_i
      @short_effect = row[2].to_s
      @effect = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_effect_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_effect_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_effect_prose.dat', Marshal.dump(DATA))
    end
  end
  class MoveEffects
    # @return [Array<MoveEffects>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_effects.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_effects.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_effects.dat', Marshal.dump(DATA))
    end
  end
  class MoveFlagMap
    # @return [Array<MoveFlagMap>]
    DATA = []
    # @return [Integer]
    attr_reader :move_id
    # @return [Integer]
    attr_reader :move_flag_id
    # @param row [Array]
    def initialize(row)
      @move_id = row[0].to_i
      @move_flag_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_flag_map.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_flag_map.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_flag_map.dat', Marshal.dump(DATA))
    end
  end
  class MoveFlagProse
    # @return [Array<MoveFlagProse>]
    DATA = []
    # @return [Integer]
    attr_reader :move_flag_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :description
    # @param row [Array]
    def initialize(row)
      @move_flag_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
      @description = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_flag_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_flag_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_flag_prose.dat', Marshal.dump(DATA))
    end
  end
  class MoveFlags
    # @return [Array<MoveFlags>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_flags.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_flags.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_flags.dat', Marshal.dump(DATA))
    end
  end
  class MoveFlavorSummaries
    # @return [Array<MoveFlavorSummaries>]
    DATA = []
    # @return [Integer]
    attr_reader :move_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :flavor_summary
    # @param row [Array]
    def initialize(row)
      @move_id = row[0].to_i
      @local_language_id = row[1].to_i
      @flavor_summary = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_flavor_summaries.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_flavor_summaries.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_flavor_summaries.dat', Marshal.dump(DATA))
    end
  end
  class MoveFlavorText
    # @return [Array<MoveFlavorText>]
    DATA = []
    # @return [Integer]
    attr_reader :move_id
    # @return [Integer]
    attr_reader :version_group_id
    # @return [Integer]
    attr_reader :language_id
    # @return [String]
    attr_reader :flavor_text
    # @param row [Array]
    def initialize(row)
      @move_id = row[0].to_i
      @version_group_id = row[1].to_i
      @language_id = row[2].to_i
      @flavor_text = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_flavor_text.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_flavor_text.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_flavor_text.dat', Marshal.dump(DATA))
    end
  end
  class MoveMeta
    # @return [Array<MoveMeta>]
    DATA = []
    # @return [Integer]
    attr_reader :move_id
    # @return [Integer]
    attr_reader :meta_category_id
    # @return [Integer]
    attr_reader :meta_ailment_id
    # @return [String]
    attr_reader :min_hits
    # @return [String]
    attr_reader :max_hits
    # @return [String]
    attr_reader :min_turns
    # @return [String]
    attr_reader :max_turns
    # @return [Integer]
    attr_reader :drain
    # @return [Integer]
    attr_reader :healing
    # @return [Integer]
    attr_reader :crit_rate
    # @return [Integer]
    attr_reader :ailment_chance
    # @return [Integer]
    attr_reader :flinch_chance
    # @return [Integer]
    attr_reader :stat_chance
    # @param row [Array]
    def initialize(row)
      @move_id = row[0].to_i
      @meta_category_id = row[1].to_i
      @meta_ailment_id = row[2].to_i
      @min_hits = row[3].to_s
      @max_hits = row[4].to_s
      @min_turns = row[5].to_s
      @max_turns = row[6].to_s
      @drain = row[7].to_i
      @healing = row[8].to_i
      @crit_rate = row[9].to_i
      @ailment_chance = row[10].to_i
      @flinch_chance = row[11].to_i
      @stat_chance = row[12].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_meta.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_meta.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_meta.dat', Marshal.dump(DATA))
    end
  end
  class MoveMetaAilmentNames
    # @return [Array<MoveMetaAilmentNames>]
    DATA = []
    # @return [Integer]
    attr_reader :move_meta_ailment_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @move_meta_ailment_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_meta_ailment_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_meta_ailment_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_meta_ailment_names.dat', Marshal.dump(DATA))
    end
  end
  class MoveMetaAilments
    # @return [Array<MoveMetaAilments>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_meta_ailments.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_meta_ailments.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_meta_ailments.dat', Marshal.dump(DATA))
    end
  end
  class MoveMetaCategories
    # @return [Array<MoveMetaCategories>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_meta_categories.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_meta_categories.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_meta_categories.dat', Marshal.dump(DATA))
    end
  end
  class MoveMetaCategoryProse
    # @return [Array<MoveMetaCategoryProse>]
    DATA = []
    # @return [Integer]
    attr_reader :move_meta_category_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :description
    # @param row [Array]
    def initialize(row)
      @move_meta_category_id = row[0].to_i
      @local_language_id = row[1].to_i
      @description = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_meta_category_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_meta_category_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_meta_category_prose.dat', Marshal.dump(DATA))
    end
  end
  class MoveMetaStatChanges
    # @return [Array<MoveMetaStatChanges>]
    DATA = []
    # @return [Integer]
    attr_reader :move_id
    # @return [Integer]
    attr_reader :stat_id
    # @return [Integer]
    attr_reader :change
    # @param row [Array]
    def initialize(row)
      @move_id = row[0].to_i
      @stat_id = row[1].to_i
      @change = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_meta_stat_changes.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_meta_stat_changes.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_meta_stat_changes.dat', Marshal.dump(DATA))
    end
  end
  class MoveNames
    # @return [Array<MoveNames>]
    DATA = []
    # @return [Integer]
    attr_reader :move_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @move_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_names.dat', Marshal.dump(DATA))
    end
  end
  class MoveTargetProse
    # @return [Array<MoveTargetProse>]
    DATA = []
    # @return [Integer]
    attr_reader :move_target_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :description
    # @param row [Array]
    def initialize(row)
      @move_target_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
      @description = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_target_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_target_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_target_prose.dat', Marshal.dump(DATA))
    end
  end
  class MoveTargets
    # @return [Array<MoveTargets>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/move_targets.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/move_targets.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/move_targets.dat', Marshal.dump(DATA))
    end
  end
  class Moves
    # @return [Array<Moves>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :generation_id
    # @return [Integer]
    attr_reader :type_id
    # @return [Integer]
    attr_reader :power
    # @return [Integer]
    attr_reader :pp
    # @return [Integer]
    attr_reader :accuracy
    # @return [Integer]
    attr_reader :priority
    # @return [Integer]
    attr_reader :target_id
    # @return [Integer]
    attr_reader :damage_class_id
    # @return [Integer]
    attr_reader :effect_id
    # @return [String]
    attr_reader :effect_chance
    # @return [Integer]
    attr_reader :contest_type_id
    # @return [Integer]
    attr_reader :contest_effect_id
    # @return [Integer]
    attr_reader :super_contest_effect_id
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @generation_id = row[2].to_i
      @type_id = row[3].to_i
      @power = row[4].to_i
      @pp = row[5].to_i
      @accuracy = row[6].to_i
      @priority = row[7].to_i
      @target_id = row[8].to_i
      @damage_class_id = row[9].to_i
      @effect_id = row[10].to_i
      @effect_chance = row[11].to_s
      @contest_type_id = row[12].to_i
      @contest_effect_id = row[13].to_i
      @super_contest_effect_id = row[14].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/moves.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/moves.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/moves.dat', Marshal.dump(DATA))
    end
  end
  class NatureBattleStylePreferences
    # @return [Array<NatureBattleStylePreferences>]
    DATA = []
    # @return [Integer]
    attr_reader :nature_id
    # @return [Integer]
    attr_reader :move_battle_style_id
    # @return [Integer]
    attr_reader :low_hp_preference
    # @return [Integer]
    attr_reader :high_hp_preference
    # @param row [Array]
    def initialize(row)
      @nature_id = row[0].to_i
      @move_battle_style_id = row[1].to_i
      @low_hp_preference = row[2].to_i
      @high_hp_preference = row[3].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/nature_battle_style_preferences.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/nature_battle_style_preferences.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/nature_battle_style_preferences.dat', Marshal.dump(DATA))
    end
  end
  class NatureNames
    # @return [Array<NatureNames>]
    DATA = []
    # @return [Integer]
    attr_reader :nature_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @nature_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/nature_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/nature_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/nature_names.dat', Marshal.dump(DATA))
    end
  end
  class NaturePokeathlonStats
    # @return [Array<NaturePokeathlonStats>]
    DATA = []
    # @return [Integer]
    attr_reader :nature_id
    # @return [Integer]
    attr_reader :pokeathlon_stat_id
    # @return [String]
    attr_reader :max_change
    # @param row [Array]
    def initialize(row)
      @nature_id = row[0].to_i
      @pokeathlon_stat_id = row[1].to_i
      @max_change = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/nature_pokeathlon_stats.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/nature_pokeathlon_stats.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/nature_pokeathlon_stats.dat', Marshal.dump(DATA))
    end
  end
  class Natures
    # @return [Array<Natures>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :decreased_stat_id
    # @return [Integer]
    attr_reader :increased_stat_id
    # @return [Integer]
    attr_reader :hates_flavor_id
    # @return [Integer]
    attr_reader :likes_flavor_id
    # @return [Integer]
    attr_reader :game_index
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @decreased_stat_id = row[2].to_i
      @increased_stat_id = row[3].to_i
      @hates_flavor_id = row[4].to_i
      @likes_flavor_id = row[5].to_i
      @game_index = row[6].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/natures.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/natures.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/natures.dat', Marshal.dump(DATA))
    end
  end
  class PalPark
    # @return [Array<PalPark>]
    DATA = []
    # @return [Integer]
    attr_reader :species_id
    # @return [Integer]
    attr_reader :area_id
    # @return [Integer]
    attr_reader :base_score
    # @return [Integer]
    attr_reader :rate
    # @param row [Array]
    def initialize(row)
      @species_id = row[0].to_i
      @area_id = row[1].to_i
      @base_score = row[2].to_i
      @rate = row[3].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pal_park.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pal_park.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pal_park.dat', Marshal.dump(DATA))
    end
  end
  class PalParkAreaNames
    # @return [Array<PalParkAreaNames>]
    DATA = []
    # @return [Integer]
    attr_reader :pal_park_area_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @pal_park_area_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pal_park_area_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pal_park_area_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pal_park_area_names.dat', Marshal.dump(DATA))
    end
  end
  class PalParkAreas
    # @return [Array<PalParkAreas>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pal_park_areas.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pal_park_areas.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pal_park_areas.dat', Marshal.dump(DATA))
    end
  end
  class PokeathlonStatNames
    # @return [Array<PokeathlonStatNames>]
    DATA = []
    # @return [Integer]
    attr_reader :pokeathlon_stat_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @pokeathlon_stat_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokeathlon_stat_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokeathlon_stat_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokeathlon_stat_names.dat', Marshal.dump(DATA))
    end
  end
  class PokeathlonStats
    # @return [Array<PokeathlonStats>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokeathlon_stats.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokeathlon_stats.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokeathlon_stats.dat', Marshal.dump(DATA))
    end
  end
  class PokedexProse
    # @return [Array<PokedexProse>]
    DATA = []
    # @return [Integer]
    attr_reader :pokedex_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :description
    # @param row [Array]
    def initialize(row)
      @pokedex_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
      @description = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokedex_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokedex_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokedex_prose.dat', Marshal.dump(DATA))
    end
  end
  class PokedexVersionGroups
    # @return [Array<PokedexVersionGroups>]
    DATA = []
    # @return [Integer]
    attr_reader :pokedex_id
    # @return [Integer]
    attr_reader :version_group_id
    # @param row [Array]
    def initialize(row)
      @pokedex_id = row[0].to_i
      @version_group_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokedex_version_groups.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokedex_version_groups.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokedex_version_groups.dat', Marshal.dump(DATA))
    end
  end
  class Pokedexes
    # @return [Array<Pokedexes>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :region_id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Boolean]
    attr_reader :is_main_series
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @region_id = row[1].to_i
      @identifier = row[2].to_s.gsub(/[^a-z_]/, '_').to_sym
      @is_main_series = row[3].to_i == 1
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokedexes.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokedexes.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokedexes.dat', Marshal.dump(DATA))
    end
  end
  class Pokemon
    # @return [Array<Pokemon>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :species_id
    # @return [Integer]
    attr_reader :height
    # @return [Integer]
    attr_reader :weight
    # @return [Integer]
    attr_reader :base_experience
    # @return [Integer]
    attr_reader :order
    # @return [Boolean]
    attr_reader :is_default
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @species_id = row[2].to_i
      @height = row[3].to_i
      @weight = row[4].to_i
      @base_experience = row[5].to_i
      @order = row[6].to_i
      @is_default = row[7].to_i == 1
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon.dat', Marshal.dump(DATA))
    end
  end
  class PokemonAbilities
    # @return [Array<PokemonAbilities>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_id
    # @return [Integer]
    attr_reader :ability_id
    # @return [Boolean]
    attr_reader :is_hidden
    # @return [Integer]
    attr_reader :slot
    # @param row [Array]
    def initialize(row)
      @pokemon_id = row[0].to_i
      @ability_id = row[1].to_i
      @is_hidden = row[2].to_i == 1
      @slot = row[3].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_abilities.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_abilities.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_abilities.dat', Marshal.dump(DATA))
    end
  end
  class PokemonAbilitiesPast
    # @return [Array<PokemonAbilitiesPast>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_id
    # @return [Integer]
    attr_reader :generation_id
    # @return [Integer]
    attr_reader :ability_id
    # @return [Boolean]
    attr_reader :is_hidden
    # @return [Integer]
    attr_reader :slot
    # @param row [Array]
    def initialize(row)
      @pokemon_id = row[0].to_i
      @generation_id = row[1].to_i
      @ability_id = row[2].to_i
      @is_hidden = row[3].to_i == 1
      @slot = row[4].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_abilities_past.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_abilities_past.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_abilities_past.dat', Marshal.dump(DATA))
    end
  end
  class PokemonColorNames
    # @return [Array<PokemonColorNames>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_color_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @pokemon_color_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_color_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_color_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_color_names.dat', Marshal.dump(DATA))
    end
  end
  class PokemonColors
    # @return [Array<PokemonColors>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_colors.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_colors.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_colors.dat', Marshal.dump(DATA))
    end
  end
  class PokemonDexNumbers
    # @return [Array<PokemonDexNumbers>]
    DATA = []
    # @return [Integer]
    attr_reader :﻿species_id
    # @return [Integer]
    attr_reader :pokedex_id
    # @return [Integer]
    attr_reader :pokedex_number
    # @param row [Array]
    def initialize(row)
      @﻿species_id = row[0].to_i
      @pokedex_id = row[1].to_i
      @pokedex_number = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_dex_numbers.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_dex_numbers.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_dex_numbers.dat', Marshal.dump(DATA))
    end
  end
  class PokemonEggGroups
    # @return [Array<PokemonEggGroups>]
    DATA = []
    # @return [Integer]
    attr_reader :species_id
    # @return [Integer]
    attr_reader :egg_group_id
    # @param row [Array]
    def initialize(row)
      @species_id = row[0].to_i
      @egg_group_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_egg_groups.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_egg_groups.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_egg_groups.dat', Marshal.dump(DATA))
    end
  end
  class PokemonEvolution
    # @return [Array<PokemonEvolution>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :evolved_species_id
    # @return [Integer]
    attr_reader :evolution_trigger_id
    # @return [Integer]
    attr_reader :trigger_item_id
    # @return [Integer]
    attr_reader :minimum_level
    # @return [Integer]
    attr_reader :gender_id
    # @return [Integer]
    attr_reader :location_id
    # @return [Integer]
    attr_reader :held_item_id
    # @return [String]
    attr_reader :time_of_day
    # @return [Integer]
    attr_reader :known_move_id
    # @return [Integer]
    attr_reader :known_move_type_id
    # @return [String]
    attr_reader :minimum_happiness
    # @return [String]
    attr_reader :minimum_beauty
    # @return [String]
    attr_reader :minimum_affection
    # @return [String]
    attr_reader :relative_physical_stats
    # @return [Integer]
    attr_reader :party_species_id
    # @return [Integer]
    attr_reader :party_type_id
    # @return [Integer]
    attr_reader :trade_species_id
    # @return [Integer]
    attr_reader :needs_overworld_rain
    # @return [Integer]
    attr_reader :turn_upside_down
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @evolved_species_id = row[1].to_i
      @evolution_trigger_id = row[2].to_i
      @trigger_item_id = row[3].to_i
      @minimum_level = row[4].to_i
      @gender_id = row[5].to_i
      @location_id = row[6].to_i
      @held_item_id = row[7].to_i
      @time_of_day = row[8].to_s
      @known_move_id = row[9].to_i
      @known_move_type_id = row[10].to_i
      @minimum_happiness = row[11].to_s
      @minimum_beauty = row[12].to_s
      @minimum_affection = row[13].to_s
      @relative_physical_stats = row[14].to_s
      @party_species_id = row[15].to_i
      @party_type_id = row[16].to_i
      @trade_species_id = row[17].to_i
      @needs_overworld_rain = row[18].to_i
      @turn_upside_down = row[19].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_evolution.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_evolution.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_evolution.dat', Marshal.dump(DATA))
    end
  end
  class PokemonFormGenerations
    # @return [Array<PokemonFormGenerations>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_form_id
    # @return [Integer]
    attr_reader :generation_id
    # @return [Integer]
    attr_reader :game_index
    # @param row [Array]
    def initialize(row)
      @pokemon_form_id = row[0].to_i
      @generation_id = row[1].to_i
      @game_index = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_form_generations.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_form_generations.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_form_generations.dat', Marshal.dump(DATA))
    end
  end
  class PokemonFormNames
    # @return [Array<PokemonFormNames>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_form_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :form_name
    # @return [String]
    attr_reader :pokemon_name
    # @param row [Array]
    def initialize(row)
      @pokemon_form_id = row[0].to_i
      @local_language_id = row[1].to_i
      @form_name = row[2].to_s
      @pokemon_name = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_form_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_form_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_form_names.dat', Marshal.dump(DATA))
    end
  end
  class PokemonFormPokeathlonStats
    # @return [Array<PokemonFormPokeathlonStats>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_form_id
    # @return [Integer]
    attr_reader :pokeathlon_stat_id
    # @return [Integer]
    attr_reader :minimum_stat
    # @return [Integer]
    attr_reader :base_stat
    # @return [Integer]
    attr_reader :maximum_stat
    # @param row [Array]
    def initialize(row)
      @pokemon_form_id = row[0].to_i
      @pokeathlon_stat_id = row[1].to_i
      @minimum_stat = row[2].to_i
      @base_stat = row[3].to_i
      @maximum_stat = row[4].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_form_pokeathlon_stats.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_form_pokeathlon_stats.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_form_pokeathlon_stats.dat', Marshal.dump(DATA))
    end
  end
  class PokemonFormTypes
    # @return [Array<PokemonFormTypes>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_form_id
    # @return [Integer]
    attr_reader :type_id
    # @return [Integer]
    attr_reader :slot
    # @param row [Array]
    def initialize(row)
      @pokemon_form_id = row[0].to_i
      @type_id = row[1].to_i
      @slot = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_form_types.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_form_types.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_form_types.dat', Marshal.dump(DATA))
    end
  end
  class PokemonForms
    # @return [Array<PokemonForms>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [String]
    attr_reader :form_identifier
    # @return [Integer]
    attr_reader :pokemon_id
    # @return [Integer]
    attr_reader :introduced_in_version_group_id
    # @return [Boolean]
    attr_reader :is_default
    # @return [Boolean]
    attr_reader :is_battle_only
    # @return [Boolean]
    attr_reader :is_mega
    # @return [Integer]
    attr_reader :form_order
    # @return [Integer]
    attr_reader :order
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @form_identifier = row[2].to_s
      @pokemon_id = row[3].to_i
      @introduced_in_version_group_id = row[4].to_i
      @is_default = row[5].to_i == 1
      @is_battle_only = row[6].to_i == 1
      @is_mega = row[7].to_i == 1
      @form_order = row[8].to_i
      @order = row[9].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_forms.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_forms.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_forms.dat', Marshal.dump(DATA))
    end
  end
  class PokemonGameIndices
    # @return [Array<PokemonGameIndices>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_id
    # @return [Integer]
    attr_reader :version_id
    # @return [Integer]
    attr_reader :game_index
    # @param row [Array]
    def initialize(row)
      @pokemon_id = row[0].to_i
      @version_id = row[1].to_i
      @game_index = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_game_indices.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_game_indices.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_game_indices.dat', Marshal.dump(DATA))
    end
  end
  class PokemonHabitatNames
    # @return [Array<PokemonHabitatNames>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_habitat_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @pokemon_habitat_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_habitat_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_habitat_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_habitat_names.dat', Marshal.dump(DATA))
    end
  end
  class PokemonHabitats
    # @return [Array<PokemonHabitats>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_habitats.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_habitats.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_habitats.dat', Marshal.dump(DATA))
    end
  end
  class PokemonItems
    # @return [Array<PokemonItems>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_id
    # @return [Integer]
    attr_reader :version_id
    # @return [Integer]
    attr_reader :item_id
    # @return [Integer]
    attr_reader :rarity
    # @param row [Array]
    def initialize(row)
      @pokemon_id = row[0].to_i
      @version_id = row[1].to_i
      @item_id = row[2].to_i
      @rarity = row[3].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_items.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_items.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_items.dat', Marshal.dump(DATA))
    end
  end
  class PokemonMoveMethodProse
    # @return [Array<PokemonMoveMethodProse>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_move_method_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :description
    # @param row [Array]
    def initialize(row)
      @pokemon_move_method_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
      @description = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_move_method_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_move_method_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_move_method_prose.dat', Marshal.dump(DATA))
    end
  end
  class PokemonMoveMethods
    # @return [Array<PokemonMoveMethods>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_move_methods.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_move_methods.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_move_methods.dat', Marshal.dump(DATA))
    end
  end
  class PokemonMoves
    # @return [Array<PokemonMoves>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_id
    # @return [Integer]
    attr_reader :version_group_id
    # @return [Integer]
    attr_reader :move_id
    # @return [Integer]
    attr_reader :pokemon_move_method_id
    # @return [Integer]
    attr_reader :level
    # @return [Integer]
    attr_reader :order
    # @param row [Array]
    def initialize(row)
      @pokemon_id = row[0].to_i
      @version_group_id = row[1].to_i
      @move_id = row[2].to_i
      @pokemon_move_method_id = row[3].to_i
      @level = row[4].to_i
      @order = row[5].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_moves.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_moves.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_moves.dat', Marshal.dump(DATA))
    end
  end
  class PokemonShapeProse
    # @return [Array<PokemonShapeProse>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_shape_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :awesome_name
    # @return [String]
    attr_reader :description
    # @param row [Array]
    def initialize(row)
      @pokemon_shape_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
      @awesome_name = row[3].to_s
      @description = row[4].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_shape_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_shape_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_shape_prose.dat', Marshal.dump(DATA))
    end
  end
  class PokemonShapes
    # @return [Array<PokemonShapes>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_shapes.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_shapes.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_shapes.dat', Marshal.dump(DATA))
    end
  end
  class PokemonSpecies
    # @return [Array<PokemonSpecies>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :generation_id
    # @return [Integer]
    attr_reader :evolves_from_species_id
    # @return [Integer]
    attr_reader :evolution_chain_id
    # @return [Integer]
    attr_reader :color_id
    # @return [Integer]
    attr_reader :shape_id
    # @return [Integer]
    attr_reader :habitat_id
    # @return [Integer]
    attr_reader :gender_rate
    # @return [Integer]
    attr_reader :capture_rate
    # @return [Integer]
    attr_reader :base_happiness
    # @return [Boolean]
    attr_reader :is_baby
    # @return [Integer]
    attr_reader :hatch_counter
    # @return [Boolean]
    attr_reader :has_gender_differences
    # @return [Integer]
    attr_reader :growth_rate_id
    # @return [Integer]
    attr_reader :forms_switchable
    # @return [Boolean]
    attr_reader :is_legendary
    # @return [Boolean]
    attr_reader :is_mythical
    # @return [Integer]
    attr_reader :order
    # @return [String]
    attr_reader :conquest_order
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @generation_id = row[2].to_i
      @evolves_from_species_id = row[3].to_i
      @evolution_chain_id = row[4].to_i
      @color_id = row[5].to_i
      @shape_id = row[6].to_i
      @habitat_id = row[7].to_i
      @gender_rate = row[8].to_i
      @capture_rate = row[9].to_i
      @base_happiness = row[10].to_i
      @is_baby = row[11].to_i == 1
      @hatch_counter = row[12].to_i
      @has_gender_differences = row[13].to_i == 1
      @growth_rate_id = row[14].to_i
      @forms_switchable = row[15].to_i
      @is_legendary = row[16].to_i == 1
      @is_mythical = row[17].to_i == 1
      @order = row[18].to_i
      @conquest_order = row[19].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_species.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_species.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_species.dat', Marshal.dump(DATA))
    end
  end
  class PokemonSpeciesFlavorSummaries
    # @return [Array<PokemonSpeciesFlavorSummaries>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_species_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :flavor_summary
    # @param row [Array]
    def initialize(row)
      @pokemon_species_id = row[0].to_i
      @local_language_id = row[1].to_i
      @flavor_summary = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_species_flavor_summaries.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_species_flavor_summaries.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_species_flavor_summaries.dat', Marshal.dump(DATA))
    end
  end
  class PokemonSpeciesFlavorText
    # @return [Array<PokemonSpeciesFlavorText>]
    DATA = []
    # @return [Integer]
    attr_reader :species_id
    # @return [Integer]
    attr_reader :version_id
    # @return [Integer]
    attr_reader :language_id
    # @return [String]
    attr_reader :flavor_text
    # @param row [Array]
    def initialize(row)
      @species_id = row[0].to_i
      @version_id = row[1].to_i
      @language_id = row[2].to_i
      @flavor_text = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_species_flavor_text.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_species_flavor_text.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_species_flavor_text.dat', Marshal.dump(DATA))
    end
  end
  class PokemonSpeciesNames
    # @return [Array<PokemonSpeciesNames>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_species_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :genus
    # @param row [Array]
    def initialize(row)
      @pokemon_species_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
      @genus = row[3].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_species_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_species_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_species_names.dat', Marshal.dump(DATA))
    end
  end
  class PokemonSpeciesProse
    # @return [Array<PokemonSpeciesProse>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_species_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :form_description
    # @param row [Array]
    def initialize(row)
      @pokemon_species_id = row[0].to_i
      @local_language_id = row[1].to_i
      @form_description = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_species_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_species_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_species_prose.dat', Marshal.dump(DATA))
    end
  end
  class PokemonStats
    # @return [Array<PokemonStats>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_id
    # @return [Integer]
    attr_reader :stat_id
    # @return [Integer]
    attr_reader :base_stat
    # @return [Integer]
    attr_reader :effort
    # @param row [Array]
    def initialize(row)
      @pokemon_id = row[0].to_i
      @stat_id = row[1].to_i
      @base_stat = row[2].to_i
      @effort = row[3].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_stats.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_stats.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_stats.dat', Marshal.dump(DATA))
    end
  end
  class PokemonTypes
    # @return [Array<PokemonTypes>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_id
    # @return [Integer]
    attr_reader :type_id
    # @return [Integer]
    attr_reader :slot
    # @param row [Array]
    def initialize(row)
      @pokemon_id = row[0].to_i
      @type_id = row[1].to_i
      @slot = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_types.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_types.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_types.dat', Marshal.dump(DATA))
    end
  end
  class PokemonTypesPast
    # @return [Array<PokemonTypesPast>]
    DATA = []
    # @return [Integer]
    attr_reader :pokemon_id
    # @return [Integer]
    attr_reader :generation_id
    # @return [Integer]
    attr_reader :type_id
    # @return [Integer]
    attr_reader :slot
    # @param row [Array]
    def initialize(row)
      @pokemon_id = row[0].to_i
      @generation_id = row[1].to_i
      @type_id = row[2].to_i
      @slot = row[3].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/pokemon_types_past.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/pokemon_types_past.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/pokemon_types_past.dat', Marshal.dump(DATA))
    end
  end
  class RegionNames
    # @return [Array<RegionNames>]
    DATA = []
    # @return [Integer]
    attr_reader :region_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @region_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/region_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/region_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/region_names.dat', Marshal.dump(DATA))
    end
  end
  class Regions
    # @return [Array<Regions>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/regions.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/regions.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/regions.dat', Marshal.dump(DATA))
    end
  end
  class StatNames
    # @return [Array<StatNames>]
    DATA = []
    # @return [Integer]
    attr_reader :stat_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @stat_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/stat_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/stat_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/stat_names.dat', Marshal.dump(DATA))
    end
  end
  class Stats
    # @return [Array<Stats>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :damage_class_id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Boolean]
    attr_reader :is_battle_only
    # @return [Integer]
    attr_reader :game_index
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @damage_class_id = row[1].to_i
      @identifier = row[2].to_s.gsub(/[^a-z_]/, '_').to_sym
      @is_battle_only = row[3].to_i == 1
      @game_index = row[4].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/stats.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/stats.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/stats.dat', Marshal.dump(DATA))
    end
  end
  class SuperContestCombos
    # @return [Array<SuperContestCombos>]
    DATA = []
    # @return [Integer]
    attr_reader :first_move_id
    # @return [Integer]
    attr_reader :second_move_id
    # @param row [Array]
    def initialize(row)
      @first_move_id = row[0].to_i
      @second_move_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/super_contest_combos.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/super_contest_combos.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/super_contest_combos.dat', Marshal.dump(DATA))
    end
  end
  class SuperContestEffectProse
    # @return [Array<SuperContestEffectProse>]
    DATA = []
    # @return [Integer]
    attr_reader :super_contest_effect_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :flavor_text
    # @param row [Array]
    def initialize(row)
      @super_contest_effect_id = row[0].to_i
      @local_language_id = row[1].to_i
      @flavor_text = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/super_contest_effect_prose.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/super_contest_effect_prose.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/super_contest_effect_prose.dat', Marshal.dump(DATA))
    end
  end
  class SuperContestEffects
    # @return [Array<SuperContestEffects>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :appeal
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @appeal = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/super_contest_effects.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/super_contest_effects.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/super_contest_effects.dat', Marshal.dump(DATA))
    end
  end
  class TypeEfficacy
    # @return [Array<TypeEfficacy>]
    DATA = []
    # @return [Integer]
    attr_reader :damage_type_id
    # @return [Integer]
    attr_reader :target_type_id
    # @return [Integer]
    attr_reader :damage_factor
    # @param row [Array]
    def initialize(row)
      @damage_type_id = row[0].to_i
      @target_type_id = row[1].to_i
      @damage_factor = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/type_efficacy.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/type_efficacy.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/type_efficacy.dat', Marshal.dump(DATA))
    end
  end
  class TypeEfficacyPast
    # @return [Array<TypeEfficacyPast>]
    DATA = []
    # @return [Integer]
    attr_reader :damage_type_id
    # @return [Integer]
    attr_reader :target_type_id
    # @return [Integer]
    attr_reader :damage_factor
    # @return [Integer]
    attr_reader :generation_id
    # @param row [Array]
    def initialize(row)
      @damage_type_id = row[0].to_i
      @target_type_id = row[1].to_i
      @damage_factor = row[2].to_i
      @generation_id = row[3].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/type_efficacy_past.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/type_efficacy_past.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/type_efficacy_past.dat', Marshal.dump(DATA))
    end
  end
  class TypeGameIndices
    # @return [Array<TypeGameIndices>]
    DATA = []
    # @return [Integer]
    attr_reader :type_id
    # @return [Integer]
    attr_reader :generation_id
    # @return [Integer]
    attr_reader :game_index
    # @param row [Array]
    def initialize(row)
      @type_id = row[0].to_i
      @generation_id = row[1].to_i
      @game_index = row[2].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/type_game_indices.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/type_game_indices.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/type_game_indices.dat', Marshal.dump(DATA))
    end
  end
  class TypeNames
    # @return [Array<TypeNames>]
    DATA = []
    # @return [Integer]
    attr_reader :type_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @type_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/type_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/type_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/type_names.dat', Marshal.dump(DATA))
    end
  end
  class Types
    # @return [Array<Types>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :generation_id
    # @return [Integer]
    attr_reader :damage_class_id
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @generation_id = row[2].to_i
      @damage_class_id = row[3].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/types.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/types.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/types.dat', Marshal.dump(DATA))
    end
  end
  class VersionGroupPokemonMoveMethods
    # @return [Array<VersionGroupPokemonMoveMethods>]
    DATA = []
    # @return [Integer]
    attr_reader :version_group_id
    # @return [Integer]
    attr_reader :pokemon_move_method_id
    # @param row [Array]
    def initialize(row)
      @version_group_id = row[0].to_i
      @pokemon_move_method_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/version_group_pokemon_move_methods.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/version_group_pokemon_move_methods.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/version_group_pokemon_move_methods.dat', Marshal.dump(DATA))
    end
  end
  class VersionGroupRegions
    # @return [Array<VersionGroupRegions>]
    DATA = []
    # @return [Integer]
    attr_reader :version_group_id
    # @return [Integer]
    attr_reader :region_id
    # @param row [Array]
    def initialize(row)
      @version_group_id = row[0].to_i
      @region_id = row[1].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/version_group_regions.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/version_group_regions.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/version_group_regions.dat', Marshal.dump(DATA))
    end
  end
  class VersionGroups
    # @return [Array<VersionGroups>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Symbol]
    attr_reader :identifier
    # @return [Integer]
    attr_reader :generation_id
    # @return [Integer]
    attr_reader :order
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @identifier = row[1].to_s.gsub(/[^a-z_]/, '_').to_sym
      @generation_id = row[2].to_i
      @order = row[3].to_i
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/version_groups.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/version_groups.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/version_groups.dat', Marshal.dump(DATA))
    end
  end
  class VersionNames
    # @return [Array<VersionNames>]
    DATA = []
    # @return [Integer]
    attr_reader :version_id
    # @return [Integer]
    attr_reader :local_language_id
    # @return [String]
    attr_reader :name
    # @param row [Array]
    def initialize(row)
      @version_id = row[0].to_i
      @local_language_id = row[1].to_i
      @name = row[2].to_s
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/version_names.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/version_names.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/version_names.dat', Marshal.dump(DATA))
    end
  end
  class Versions
    # @return [Array<Versions>]
    DATA = []
    # @return [Integer]
    attr_reader :id
    # @return [Integer]
    attr_reader :version_group_id
    # @return [Symbol]
    attr_reader :identifier
    # @param row [Array]
    def initialize(row)
      @id = row[0].to_i
      @version_group_id = row[1].to_i
      @identifier = row[2].to_s.gsub(/[^a-z_]/, '_').to_sym
    end
    def self.load
      return unless DATA.empty?
      dat_filename = 'data/versions.dat'
      return DATA.concat(Marshal.load(File.binread(dat_filename))) if File.exist?(dat_filename)
      rows = CSV.read('pokeapi/data/v2/csv/versions.csv', liberal_parsing: true)
      rows.shift
      DATA.concat(rows.map { |row| new(row) })
    end
    def self.save
      File.binwrite('data/versions.dat', Marshal.dump(DATA))
    end
  end
  module_function
  def load_all
    constants.each { |c| const_get(c).load }
  end
  def save_all
    constants.each { |c| const_get(c).save }
  end
end
