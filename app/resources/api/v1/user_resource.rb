class Api::V1::UserResource < JSONAPI::Resource
  attributes :email, :password, :password_digest, :firstname, :lastname
  has_many :posts
end
