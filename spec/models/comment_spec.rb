require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should define_enum_for(:status).with([:pending, :active]) }

  it { should validate_presence_of :post }
  it { should validate_presence_of :fullname }
  it { should validate_presence_of :content }
  it { should validate_presence_of :status }

  it { should belong_to(:post) }
end