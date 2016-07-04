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
