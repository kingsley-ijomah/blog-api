require 'rails_helper'

RSpec.describe "Api::V1::Frontend::Tags::Crud", type: :request do

  # cruds to be generated
  crud_methods = ['index']

  include_examples "crud_requests", crud_methods do 
    let(:model) { Tag }
    let(:api_version) { 'v1' }
    let(:namespace) { 'frontend' }
    let(:belongs_to) { {} }
  end
end