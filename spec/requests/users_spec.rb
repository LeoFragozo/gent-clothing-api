
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #show' do
    it 'must return 200 http status' do
      user = create(:user)

      get '/api/v1//users'

      expect(response).to have_http_status(:ok)
    end

    it 'must return the current user data' do
      user = create(:user)

      get '/api/v1/users'

      expect(json_body[:data][0]).to have_key(:id)
      expect(json_body[:data][0]).to have_key(:name)
      expect(json_body[:data][0]).to have_key(:email)
      expect(json_body[:data][0]).to have_key(:password)
    end

    it 'tests the keys values' do
      user = create(:user)

      get '/api/v1/users'

      expect(json_body[:data][0][:name]).to eq('Leo')
      expect(json_body[:data][0][:email]).to eq('lqfragozo@gmail.com')
      expect(json_body[:data][0][:password]).to eq('123456')
    end
  end

   it 'update the user' do
    user = create(:user)
    body_data = { user: {name: 'Matheus', email: 'matheus.teste@gmail.com', password: '654321' }}

    put "/api/v1/users/#{user.id}", params: body_data
  
    expect(response.status).to eq(200)
  end

  it "deletes the user" do
    
    user = create(:user)

    delete "/api/v1/users/#{user.id}"

    expect(response.status).to eq(200) 
  end
    
end