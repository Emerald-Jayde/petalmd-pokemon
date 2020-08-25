require 'rails_helper'

describe "POST /api/v1/pokemons", :type => :request do
  before do
    post '/api/v1/pokemons', params: {
      pokemon: {
        name: 'test',
        type_1: 'water',
        type_2: 'fire',
        total: 150,
        hp: 80,
        attack: 45,
        defense: 60,
        sp_atk: 100,
        sp_def: 110,
        speed: 120,
        generation: 4,
        legendary: true
      }
    }
  end

  it 'returns pokemon name' do
    expect(JSON.parse(response.body)['name']).to eq('test')
  end

  it 'returns pokemon type_1' do
    expect(JSON.parse(response.body)['type_1']).to eq('water')
  end

  it 'returns pokemon type_2' do
    expect(JSON.parse(response.body)['type_2']).to eq('fire')
  end

  it 'returns pokemon total' do
    expect(JSON.parse(response.body)['total']).to eq(150)
  end

  it 'returns pokemon hp' do
    expect(JSON.parse(response.body)['hp']).to eq(80)
  end

  it 'returns pokemon attack' do
    expect(JSON.parse(response.body)['attack']).to eq(45)
  end

  it 'returns pokemon defense' do
    expect(JSON.parse(response.body)['defense']).to eq(60)
  end

  it 'returns pokemon sp_atk' do
    expect(JSON.parse(response.body)['sp_atk']).to eq(100)
  end

  it 'returns pokemon sp_def' do
    expect(JSON.parse(response.body)['sp_def']).to eq(110)
  end

  it 'returns pokemon speed' do
    expect(JSON.parse(response.body)['speed']).to eq(120)
  end

  it 'returns pokemon generation' do
    expect(JSON.parse(response.body)['generation']).to eq(4)
  end

  it 'returns pokemon legendary' do
    expect(JSON.parse(response.body)['legendary']).to eq(true)
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
