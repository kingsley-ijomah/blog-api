require 'rails_helper'

RSpec.describe Api::V1::Backend::TagResource, type: :resource do
  let(:tag) { create(:tag) }
  subject { described_class.new(tag, {}) }

  it { is_expected.to have_attribute :name }

  it { is_expected.to have_many(:post_tags) }
  it { is_expected.to have_many(:posts) }
end