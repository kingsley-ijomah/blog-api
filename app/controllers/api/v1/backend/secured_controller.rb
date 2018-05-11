class Api::V1::Backend::SecuredController < ApplicationController
  include Knock::Authenticable
  before_action :authenticate_user

  def context
    {current_user: current_user}
  end
end