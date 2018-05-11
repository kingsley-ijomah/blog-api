class Api::V1::Backend::UsersController < Api::V1::Backend::SecuredController
  def_param_group :attributes do
    param :attributes, Hash, required: true do
      param :email, String, required: true
      param :password, String, required: true
      param :firstname, String, required: true
      param :lastname, String, required: true
    end
  end

  def_param_group :create do
    param :data, Hash, :required => true, :action_aware => true do
      param :type, String, required: true
      param_group :attributes
    end
  end

  def_param_group :update do
    param :data, Hash, :required => true, :action_aware => true do
      param :type, String, required: true
      param :id, :number, required: true
      param_group :attributes
    end
  end

  @table = 'users'

  api :GET, "/v1//:id", ' # show'
  param :id, :number, required: true
  error 404, 'Resource not found'
  error 401, 'Unauthorized'
  def show
    super
  end

  api :POST, "/v1/", ' # create'
  param_group :create
  error 400, 'Invalid request'
  error 422, 'Invalid data'
  error 401, 'Unauthorized'
  def create
    super
  end

  api :PUT, "/v1//:id", ' # update'
  param_group :update
  error 400, 'Invalid request'
  error 422, 'Invalid data'
  error 401, 'Unauthorized'
  def update
    super
  end

  api :DELETE, "/v1//:id", ' # delete'
  param :id, :number, required: true
  error 401, 'Unauthorized'
  error 404, 'Resource not found'
  def delete
    super
  end
end
