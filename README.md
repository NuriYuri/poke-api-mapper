# PokeAPI Mapper

This repository contains ruby scripts helping to map PokeAPI data to usable data like [Pokémon Studio](https://github.com/PokemonWorkshop/PokemonStudio) data files.

## Setup

### When schema is already generated

1. Have Ruby
2. Run `git submodule update --init`
3. Open IRB at repository root
4. Run `require_relative 'generated/schema'`
5. Run `PokeAPI.load_all`
6. Run `PokeAPI.save_all`

This allows other script to run faster by not having to parse CSV files.

### When schema is not generated or you want to regenerate the schema

1. Run `ruby scripts/generate_schema.rb`
2. Do setup instruction for `When schema is already generated`

## Scripts

- `ruby scripts/generate_type_by_gen.rb GEN_ID`: generates the Pokémon Studio types into `out/types` based on the generation you want.
- `ruby scripts/generate_type_text.rb`: Generate the CSV file containing the type names in the available locales (in PSDK format).
