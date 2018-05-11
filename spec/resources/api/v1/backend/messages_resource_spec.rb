require 'rails_helper'

RSpec.describe Api::V1::Backend::MessageResource, type: :resource do
  let(:message) { create(:message) }
  subject { described_class.new(message, {}) }

  it { is_expected.to have_attribute :fullname }
  it { is_expected.to have_attribute :email }
  it { is_expected.to have_attribute :content }
end