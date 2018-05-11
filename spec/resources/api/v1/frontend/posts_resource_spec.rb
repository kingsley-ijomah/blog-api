require 'rails_helper'

RSpec.describe Api::V1::Frontend::PostResource, type: :resource do
  let(:post) { create(:post) }
  subject { described_class.new(post, {}) }

  it { is_expected.to have_attribute :title }
  it { is_expected.to have_attribute :comment }
  it { is_expected.to have_attribute :status }

  it { is_expected.to have_many(:comments) }

  it { is_expected.to have_many(:post_tags) }
  it { is_expected.to have_many(:tags) }
end