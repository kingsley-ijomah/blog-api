class Post < ApplicationRecord
  belongs_to :user

  enum status: [:pending, :active]
  validates :title, :comment, :user, :status, presence: true
end
