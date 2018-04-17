require 'rails_helper'

RSpec.describe "UserTokens", type: :request do
  describe "POST #create" do
    let(:user) { create(:user) }

    it 'returns success status code 201' do
      post '/user_token', params: {
        auth: {
          email: user.email,
          password: user.password
        }
      }.to_json, headers: api_headers

      expect(json.has_key?('jwt')).to be(true)
      expect(response).to have_http_status(201)
    end
  end
end
