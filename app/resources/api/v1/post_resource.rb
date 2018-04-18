class Api::V1::PostResource < JSONAPI::Resource
  attributes :title, :comment, :status, :user_id
end
