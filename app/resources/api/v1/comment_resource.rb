class Api::V1::CommentResource < JSONAPI::Resource
  attributes :fullname, :content, :post_id, :status
end
