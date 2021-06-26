# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities', type: :request do
  describe 'GET #show' do
    it 'must return 200 http status' do
      city = create(:city)

      get '/api/v1//cities'

      expect(response).to have_http_status(:ok)
    end

    it 'must return the current city data' do
      city = create(:city)

      get '/api/v1/cities'

      expect(json_body[:data][0]).to have_key(:id)
      expect(json_body[:data][0]).to have_key(:name)
      expect(json_body[:data][0]).to have_key(:state)
      expect(json_body[:data][0]).to have_key(:country)
    end

    it 'tests the keys values' do
      city = create(:city)

      get '/api/v1/cities'

      expect(json_body[:data][0][:name]).to eq('Carazinho')
      expect(json_body[:data][0][:state]).to eq('Rio Grande do Sul')
      expect(json_body[:data][0][:country]).to eq('Brasil')
    end
  end

  it 'update the city' do
    city = create(:city)
    body_data = { city: { name: 'Passo Fundo', state: 'Rio Grande do Sul', country: 'Brasil' } }

    put "/api/v1/cities/#{city.id}", params: body_data

    expect(response.status).to eq(200)
  end

  it 'deletes the city' do
    city = create(:city)

    delete "/api/v1/cities/#{city.id}"

    expect(response.status).to eq(200)
  end
end
