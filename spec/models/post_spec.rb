require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should define_enum_for(:status).with([:pending, :active]) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :comment }
  it { should validate_presence_of :user }
  it { should validate_presence_of :status }

  it { should have_attached_file(:image) }
  it { should validate_attachment_content_type(:image).
        allowing("image/gif", "image/png", "image/jpeg", "image/jpg").
        rejecting('text/plain', 'text/xml') }

  it { should belong_to(:user) }
  it { should have_many(:comments).dependent(:destroy) }

  it { should have_many(:post_tags).dependent(:destroy) }
  it { should have_many(:tags).through(:post_tags) }
end