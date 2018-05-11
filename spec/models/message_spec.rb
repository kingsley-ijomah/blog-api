require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should validate_presence_of :fullname }
  it { should validate_presence_of :email }
  it { should validate_presence_of :content }
  it { should_not allow_value('test').for(:email) }
  it { should allow_value('test@email.com').for(:email) }
end
