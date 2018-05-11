require 'rails_helper'

RSpec.describe "Api::V1::Backend::MailingLists::Crud", type: :request do
  # cruds to be generated
  crud_methods = ['index', 'delete']

  include_examples "crud_requests", crud_methods do 
    let(:model) { MailingList }
    let(:api_version) { 'v1' }
    let(:namespace) { 'backend' }
    let(:belongs_to) { {} }
  end
end
