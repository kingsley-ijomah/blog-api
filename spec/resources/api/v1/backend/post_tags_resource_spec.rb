require 'rails_helper'

RSpec.describe Api::V1::Backend::PostTagResource, type: :resource do
  let(:post_tag) { create(:post_tag)  }
  subject { described_class.new(post_tag, {}) }

  it { is_expected.to have_attribute :post_id }
  it { is_expected.to have_attribute :tag_id }

  it { is_expected.to have_one(:post) }
  it { is_expected.to have_one(:tag) }
end