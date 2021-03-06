require 'rails_helper'

RSpec.describe "Api::V1::Backend::Users::Cruds", type: :request do
  # cruds to be generated
  crud_methods = ['show', 'create', 'update', 'delete']

  include_examples "crud_requests", crud_methods do 
    let(:model) { User }
    let(:api_version) { 'v1' }
    let(:namespace) { 'backend' }
    let(:belongs_to) { {} }
  end
end
