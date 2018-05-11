class Api::V1::Frontend::PostTagResource < JSONAPI::Resource
  has_one :post
  has_one :tag
  
  attributes :post_id, :tag_id
end