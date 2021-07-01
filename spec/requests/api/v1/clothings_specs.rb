# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ''clothings', type: :request do
  describe 'GET #show' do
    it 'must return 200 http status' do
      clothing = create(:clothing)

      get '/api/v1//clothings'

      expect(response).to have_http_status(:ok)
    end

    it 'must return the current clothing data' do
      clothing = create(:clothing)

      get '/api/v1/clothings'

      expect(json_body[:data][0]).to have_key(:id)
      expect(json_body[:data][0]).to have_key(:description)
      expect(json_body[:data][0]).to have_key(:dresscode)
      expect(json_body[:data][0]).to have_key(:color)
    end

    it 'tests the keys values' do
      clothing = create(:clothing)

      get '/api/v1/clothings'

      expect(json_body[:data][0][:description]).to eq('Oxford Shirt')
      expect(json_body[:data][0][:dresscode]).to eq('Business Casual')
      expect(json_body[:data][0][:color]).to eq('White')
    end
  end

  it 'update the clothing' do
    clothing = create(:clothing)
    body_data = { clothing: { description: 'Pique Waistcoat', dresscode: 'White Tie', color: 'White' } }

    put "/api/v1/clothings/#{clothing.id}", params: body_data

    expect(response.status).to eq(200)
  end

  it 'deletes the clothing' do
    clothing = create(:clothing)

    delete "/api/v1/clothings/#{clothing.id}"

    expect(response.status).to eq(200)
  end
end
