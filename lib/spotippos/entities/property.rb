class Property
  attr_reader :id, :title, :price, :description, :x, :y, :beds, :baths
  attr_reader :square_meters

  def initialize(attributes={})
    @title = attributes[:title].to_s
    @price = attributes[:price]
    @description = attributes[:description].to_s
    @x = attributes.fetch(:x) { 0 }
    raise ArgumentError unless (0..1400).cover? x
    @y = attributes.fetch(:y) { 0 }
    raise ArgumentError unless (0..1000).cover? y
    @beds = attributes.fetch(:beds) { 1 }
    raise ArgumentError unless (1..5).cover? beds
    @baths = attributes.fetch(:baths) { 1 }
    raise ArgumentError unless (1..4).cover? baths
    @square_meters = attributes.fetch(:square_meters) { 20 }
    raise ArgumentError unless (20..240).cover? square_meters
  end

  def self.create(hsh={})
    hsh = Hanami::Utils::Hash.new(hsh).symbolize!
    hsh[:properties].map do |h|
      h = Hanami::Utils::Hash.new(h).symbolize!
      square_meters = h.delete :squareMeters
      new h.update(square_meters: square_meters)
    end
  end
end
