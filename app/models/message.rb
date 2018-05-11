class Message < ApplicationRecord
  validates :fullname, :email, :content, presence: true
  validates_format_of :email, with: /@/
end
