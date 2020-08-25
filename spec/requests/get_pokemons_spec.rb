require 'rails_helper'

describe "GET /api/v1/pokemons", :type => :request do
  let!(:pokemons) { FactoryBot.create_list(:random_pokemon, 20) }
  before { get '/api/v1/pokemons' }

  it 'returns all pokemons' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

describe "get paginated pokemons route", :type => :request do
  let!(:pokemons) { FactoryBot.create_list(:random_pokemon, 20) }
  before { get '/api/v1/pokemons?page=2&limit=15' }

  it 'returns 5 pokemons' do
    expect(JSON.parse(response.body).size).to eq(5)
  end
end
