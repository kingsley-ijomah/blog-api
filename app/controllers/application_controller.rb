class ApplicationController < JSONAPI::ResourceController
  include Knock::Authenticable
  before_action :authenticate_user

  def context
    {current_user: current_user}
  end
end
