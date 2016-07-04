class Province
  attr_reader :name, :top, :right, :bottom, :left

  def initialize(attributes={})
    @name = attributes[:name].to_s
    @top = attributes.fetch(:top) { 0 }.to_i
    @right = attributes.fetch(:right) { 0 }.to_i
    @bottom = attributes.fetch(:bottom) { 0 }.to_i
    @left = attributes.fetch(:left) { 0 }.to_i
    raise ArgumentError if name.empty?
    [top, bottom].each { |y| raise ArgumentError unless (0..1400).cover? y }
    [left, right].each { |x| raise ArgumentError unless (0..1000).cover? x }
  end

  def self.create(options)
    options.map do |key, value|
      upper_left = value['boundaries']['upperLeft']
      bottom_right = value['boundaries']['bottomRight']
      top = upper_left['y']
      right = bottom_right['x']
      bottom = bottom_right['y']
      left = upper_left['x']
      new name: key, top: top, right: right, bottom: bottom, left: left
    end
  end
end
