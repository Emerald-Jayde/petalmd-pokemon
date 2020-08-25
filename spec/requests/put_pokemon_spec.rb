require 'rails_helper'

describe "PUT /api/v1/pokemons/:id" do
  let(:attr) do
    { name: Faker::Name.unique.name, attack: Faker::Number.digit }
  end

  before(:each) do
    @pokemon = FactoryBot.create(:random_pokemon)
    put "/api/v1/pokemons/#{@pokemon.id}", params: { pokemon: attr }
    @pokemon.reload
  end

  it 'updates a pokemon' do
    expect(response.status).to eq(200)
    expect(Pokemon.find(@pokemon.id).name).to eq(attr[:name])
    expect(Pokemon.find(@pokemon.id).attack).to eq(attr[:attack])
  end
end
