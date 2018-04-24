class Comment < ApplicationRecord
  belongs_to :post

  enum status: [:pending, :active]
  validates :fullname, :content, :post, :status, presence: true
end
