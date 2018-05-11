class Api::V1::Backend::PostTagResource < JSONAPI::Resource
  has_one :post # has_one is same as belongs_to
  has_one :tag # has_one is same as belongs_to
  
  attributes :post_id, :tag_id
end