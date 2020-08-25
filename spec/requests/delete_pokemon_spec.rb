require 'rails_helper'

describe "DELETE /api/v1/pokemons/:id" do
  before(:each) do
    @pokemon_one = FactoryBot.create(:random_pokemon)
    @pokemon_two = FactoryBot.create(:random_pokemon)
    @pokemon_one_id = @pokemon_one.id
    @pokemon_one_name = @pokemon_one.name
  end

  it 'should delete the pokemon' do
    get "/api/v1/pokemons"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq([YAML.load(@pokemon_one.to_json),YAML.load(@pokemon_two.to_json),])
    delete "/api/v1/pokemons/#{@pokemon_one.id}"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['message']).to eq("#{@pokemon_one_name} (id: #{@pokemon_one_id}) has been deleted!")
  get "/api/v1/pokemons"
    expect(JSON.parse(response.body)).to eq([YAML.load(@pokemon_two.to_json)])
  end
end
