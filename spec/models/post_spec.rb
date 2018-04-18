require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should define_enum_for(:status).with([:pending, :active]) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :comment }
  it { should validate_presence_of :user }
  it { should validate_presence_of :status }

  it { should belong_to(:user) }
end