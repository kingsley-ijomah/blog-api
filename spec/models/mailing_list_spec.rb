require 'rails_helper'

RSpec.describe MailingList, type: :model do
  # https://github.com/thoughtbot/shoulda-matchers/blob/585f651460026045f590ea27e14f6c5f09e8e6c4/lib/shoulda/matchers/active_model/validate_uniqueness_of_matcher.rb#L28
  let!(:mailing_list) { create(:mailing_list) }

  it { should validate_presence_of :fullname }
  it { should validate_presence_of :email }
  it { should_not allow_value('test').for(:email) }
  it { should allow_value('test@email.com').for(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
end
