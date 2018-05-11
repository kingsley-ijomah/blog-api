require 'rails_helper'

RSpec.describe "Api::V1::Backend::Comments::Crud", type: :request do

  # cruds to be generated
  crud_methods = ['create']

  include_examples "crud_requests", crud_methods do 
    let(:model) { Comment }
    let(:api_version) { 'v1' }
    let(:namespace) { 'backend' }
    let(:belongs_to) { { post_id: create(:post).id } }
  end
end