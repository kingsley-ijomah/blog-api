require 'rails_helper'

RSpec.describe "Api::V1::Backend::Posts::Crud", type: :request do
  # cruds to be generated
  crud_methods = ['index', 'show', 'create', 'update', 'delete']

  include_examples "crud_requests", crud_methods do 
    let(:model) { Post }
    let(:api_version) { 'v1' }
    let(:namespace) { 'backend' }
    let(:belongs_to) { { user_id: create(:user).id } }
  end
end
