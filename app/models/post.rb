class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  enum status: [:pending, :active]
  validates :title, :comment, :user, :status, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: ["image/gif", "image/png", "image/jpeg", "image/jpg"]
end
