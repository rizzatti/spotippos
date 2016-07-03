class Province
  attr_reader :name, :boundaries

  def initialize(name, boundaries)
    name, boundaries = name.to_s, boundaries.to_a
    raise ArgumentError if name.empty? or boundaries.size != 2
    @name = name
    @boundaries = boundaries
  end

  def left
    boundaries.first.x
  end

  def top
    boundaries.first.y
  end

  def right
    boundaries.last.x
  end

  def bottom
    boundaries.last.y
  end

  def self.create(options)
    options.map do |key, value|
      upper_left = value['boundaries']['upperLeft']
      upper_left = Coordinate.new upper_left['x'], upper_left['y']
      bottom_right = value['boundaries']['bottomRight']
      bottom_right = Coordinate.new bottom_right['x'], bottom_right['y']
      new key, [upper_left, bottom_right]
    end
  end
end
