require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # create the user object and save it into database
  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:headers) do
    {
      'Accept' => 'application/vnd.users.v1',
      'Content-type' => Mime[:json].to_s
    }
  end

  before { host! 'api.users.dev' }

  describe 'GET /users' do
    before do
      create_list(:user, 4)
      get '/users', params: {}, headers: headers
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns 5 users' do
      expect(json_body.size).to eq 5
    end
  end

  describe 'GET /users/:id' do
    before do
      get "/users/#{user_id}", params: {}, headers: headers 
    end

    context 'when the user exists' do
      it 'returns the user' do
        expect(json_body[:id]).to eq(user_id)
      end

      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user does not exist' do
      let(:user_id) { 1000000 }
      it 'returns status 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /users' do
    before do
      post '/users', params: { user: user_params }.to_json, headers: headers
    end

    context 'when the request params are valid' do
      let(:user_params) { attributes_for(:user) }

      it 'returns status 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns user data' do
        expect(json_body[:email]).to eq(user_params[:email])
      end
    end

    context 'when the request params are invalid' do
      let(:user_params) { attributes_for(:user, email: 'lucas.com.br') }

      it 'returns status 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns json data for errors' do
        expect(json_body).to have_key(:errors)
      end
    end
  end
end