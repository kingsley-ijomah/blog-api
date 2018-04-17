module JsonapiHeaders
  extend ActiveSupport::Concern

  included do 
    before(:all) do 
      @login_user = create(:user)
    end

    def api_headers(auth_token: generate_jwt)
      {
        HTTP_ACCEPT: 'application/vnd.api+json',
        CONTENT_TYPE: 'application/vnd.api+json',
        Authorization: "Bearer #{auth_token}"
      }
    end

    private

    def generate_jwt
      post '/user_token', params: {
        auth: {
          email: @login_user.email, 
          password: @login_user.password
        }
      }
      # return jwt
      json_jwt
    end
  end
end
