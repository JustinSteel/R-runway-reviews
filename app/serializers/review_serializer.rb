class ReviewSerializer
  include JSONAPI::Serializer
  attributes :user_id, :airport_id, :comment, :category

  belongs_to :user
end