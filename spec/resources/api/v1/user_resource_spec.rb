require 'rails_helper'

RSpec.describe Api::V1::UserResource, type: :resource do
  let(:user) { create(:user) }
  subject { described_class.new(user, {}) }

  it { is_expected.to have_attribute :email }
  it { is_expected.to have_attribute :password }
  it { is_expected.to have_many(:posts) }
end