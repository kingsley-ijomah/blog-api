require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password_digest }
  it { should validate_presence_of :firstname }
  it { should validate_presence_of :lastname }

  it { should respond_to :password_digest}
  it { should respond_to :authenticate}

  it { should have_many(:posts) }
end 
