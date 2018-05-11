class Api::V1::Backend::MessageResource < JSONAPI::Resource
  attributes :fullname, :email, :content
end