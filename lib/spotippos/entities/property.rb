class Property
  include Hanami::Entity
  attributes :id, :title, :price, :description, :x, :y, :beds, :baths
  attributes :square_meters

  def initialize(attributes={})
    super
    self.title ||= title.to_s
    self.description ||= description.to_s
    self.x ||= 0
    raise ArgumentError unless (0..1400).cover? x
    self.y ||= 0
    raise ArgumentError unless (0..1000).cover? y
    self.beds ||= 1
    raise ArgumentError unless (1..5).cover? beds
    self.baths ||= 1
    raise ArgumentError unless (1..4).cover? baths
    self.square_meters ||= 20
    raise ArgumentError unless (20..240).cover? square_meters
  end

  def self.create_in_batches(hsh={})
    hsh = Hanami::Utils::Hash.new(hsh).symbolize!
    hsh[:properties].map { |e| create e }
  end

  def self.create(hsh={})
    hsh = Hanami::Utils::Hash.new(hsh).symbolize!
    square_meters = hsh.delete :squareMeters
    new hsh.update(square_meters: square_meters)
  end
end
