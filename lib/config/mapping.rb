collection :provinces do
  entity Province
  repository ProvinceRepository
  attribute :id, Integer
  attribute :name, String
  attribute :top, Integer
  attribute :right, Integer
  attribute :bottom, Integer
  attribute :left, Integer
end

collection :properties do
  entity Property
  repository PropertyRepository
  attribute :id, Integer
  attribute :title, String
  attribute :description, String
  attribute :price, Float
  attribute :x, Integer
  attribute :y, Integer
  attribute :beds, Integer
  attribute :baths, Integer
  attribute :square_meters, Integer
end
