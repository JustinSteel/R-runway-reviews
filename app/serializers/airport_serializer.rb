class AirportSerializer
  include JSONAPI::Serializer
  attributes :name, :id
end