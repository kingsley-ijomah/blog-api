class Api::V1::Frontend::CommentResource < JSONAPI::Resource
  attributes :fullname, :content, :post_id, :status
end
