require 'rails_helper'

RSpec.describe Api::V1::Backend::CommentResource, type: :resource do
  let(:comment) { create(:comment) }
  subject { described_class.new(comment, {}) }

  it { is_expected.to have_attribute :fullname }
  it { is_expected.to have_attribute :content }
  it { is_expected.to have_attribute :post_id }
  it { is_expected.to have_attribute :status }
end