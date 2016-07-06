attributes :id, :title, :description, :price, :x, :y, :beds, :baths,
  :squareMeters
node :provinces do |p|
  p.province_list locals[:provinces]
end
