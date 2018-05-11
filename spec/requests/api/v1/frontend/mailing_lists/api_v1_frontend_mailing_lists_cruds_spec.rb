require 'rails_helper'

RSpec.describe "Api::V1::Frontend::MailingLists::Crud", type: :request do
  # cruds to be generated
  crud_methods = ['create']

  include_examples "crud_requests", crud_methods do 
    let(:model) { MailingList }
    let(:api_version) { 'v1' }
    let(:namespace) { 'frontend' }
    let(:belongs_to) { {} }
  end
end