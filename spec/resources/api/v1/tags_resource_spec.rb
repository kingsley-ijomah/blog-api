require 'rails_helper'

RSpec.describe Api::V1::TagResource, type: :resource do
  let(:tag) { create(:tag) }
  subject { described_class.new(tag, {}) }

  it { is_expected.to have_attribute :name }
end