require 'rails_helper'

RSpec.describe "Api::V1::Frontend::Posts::Crud", type: :request do

  # cruds to be generated
  crud_methods = ['index', 'show']

  include_examples "crud_requests", crud_methods do 
    let(:model) { Post }
    let(:api_version) { 'v1' }
    let(:namespace) { 'frontend' }
    let(:belongs_to) { {} }
  end
end