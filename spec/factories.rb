FactoryBot.define do
  types = ["Grass", "Fire", "Water", "Bug", "Normal", "Poison", "Electric", "Flying", "Fairy"]
  factory :random_pokemon, class: Pokemon do
    name { Faker::Name.unique.name }
    type_1 { types.sample }
    type_2 { types.sample }
    total { Faker::Number.between(300, 700) }
    hp { Faker::Number.between(45, 160) }
    attack { Faker::Number.between(50, 120) }
    defense { Faker::Number.between(50, 100) }
    sp_atk { Faker::Number.between(50, 100) }
    sp_def { Faker::Number.between(50, 100) }
    speed { Faker::Number.between(30, 150) }
    generation { Faker::Number.between(1, 4) }
    legendary { Faker::Boolean.boolean }
  end
end
