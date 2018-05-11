class Api::V1::Backend::TagResource < JSONAPI::Resource
  attributes :name

  has_many :post_tags
  has_many :posts, through: :post_tags
end
