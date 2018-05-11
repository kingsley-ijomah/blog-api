class Api::V1::Backend::CommentResource < JSONAPI::Resource
  attributes :fullname, :content, :post_id, :status
end
