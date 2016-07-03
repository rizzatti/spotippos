class Coordinate
  attr_reader :x, :y

  def initialize(x=0, y=0)
    x, y = x.to_i, y.to_i
    raise ArgumentError unless (0..1400).cover? x and (0..1000).cover? y
    @x, @y = x, y
  end
end
