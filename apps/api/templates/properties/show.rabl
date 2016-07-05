object property
attributes :id, :title, :description, :price, :x, :y, :beds, :baths
node :squareMeters do |p|
  p.square_meters
end
node :provinces do |p|
  provinces.select { |pr| (pr.left..pr.right).cover? p.x }.
    select { |pr| (pr.bottom..pr.top).cover? p.y }.
    map(&:name)
end
