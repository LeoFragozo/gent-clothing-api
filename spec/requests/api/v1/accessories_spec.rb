# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Accessories', type: :request do
  describe 'GET #show' do
  it 'must return 200 http status' do
    accessory = create(:accessory)

    get '/api/v1/accessories'

    expect(response).to have_http_status(:ok)
  end

  it 'must return the current clothing data' do
    clothing = create(:clothing)

    get '/api/v1/accessories'

    expect(json_body[:data][0]).to have_key(:id)
    expect(json_body[:data][0]).to have_key(:description)
    expect(json_body[:data][0]).to have_key(:dresscode)
    expect(json_body[:data][0]).to have_key(:color)
  end

  it 'tests the keys values' do
    accessory = create(:accessory)

    get '/api/v1/accessories'

    expect(json_body[:data][0][:description]).to eq('Oxford shoes')
    expect(json_body[:data][0][:dresscode]).to eq('Business/Black Tie')
    expect(json_body[:data][0][:color]).to eq('Black')
  end
end

it 'update the accessory' do
  accessory = create(:accessory)
  body_data = { accessory: { description: 'Kid Gloves', dresscode: 'White Tie', color: 'White' } }

  put "/api/v1/accessories/#{accessory.id}", params: body_data

  expect(response.status).to eq(200)
end

it 'deletes the accessory' do
  accessory = create(:accessory)

  delete "/api/v1/accessories/#{accessory.id}"

  expect(response.status).to eq(200)
  end
end