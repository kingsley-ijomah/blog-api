require 'rails_helper'

RSpec.describe PostTag, type: :model do
  it { should belong_to(:post) }
  it { should belong_to(:tag) }
end
