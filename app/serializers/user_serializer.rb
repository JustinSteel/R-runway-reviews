class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :email

  has_many :reviews
end