class PropertyDecorator < SimpleDelegator
  def squareMeters
    square_meters
  end

  def province_list(provinces)
    provinces.select { |province| (province.left..province.right).cover? x }.
      select { |province| (province.bottom..province.top).cover? y }.
      map(&:name)
  end
end
