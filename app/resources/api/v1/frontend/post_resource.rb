class Api::V1::Frontend::PostResource < JSONAPI::Resource
  attributes :title, :comment, :status, :user_id
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags
end
