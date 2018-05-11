require 'rails_helper'

RSpec.describe Api::V1::Backend::MailingListResource, type: :resource do
  let(:mailing_list) { create(:mailing_list) }
  subject { described_class.new(mailing_list, {}) }

  it { is_expected.to have_attribute :fullname }
  it { is_expected.to have_attribute :email }
end