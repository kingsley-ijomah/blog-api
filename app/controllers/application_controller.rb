class ApplicationController < JSONAPI::ResourceController
  include Knock::Authenticable
  before_action :authenticate_user
end
