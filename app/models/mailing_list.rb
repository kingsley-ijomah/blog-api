class MailingList < ApplicationRecord
  validates :fullname, :email, presence: true
  validates_format_of :email, with: /@/
  validates_uniqueness_of :email, case_sensitive: false
end
