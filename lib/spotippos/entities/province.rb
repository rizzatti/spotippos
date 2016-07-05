class Province
  include Hanami::Entity
  attributes :id, :name, :top, :right, :bottom, :left

  def initialize(attributes={})
    super
    self.name = name.to_s
    self.top = top.to_i
    self.right = right.to_i
    self.bottom = bottom.to_i
    self.left = left.to_i
    raise ArgumentError if name.empty?
    [top, bottom].each { |y| raise ArgumentError unless (0..1000).cover? y }
    [left, right].each { |x| raise ArgumentError unless (0..1400).cover? x }
  end

  def self.create(hsh={})
    hsh = Hanami::Utils::Hash.new(hsh).symbolize!
    hsh.map do |key, value|
      upper_left = value[:boundaries][:upperLeft]
      bottom_right = value[:boundaries][:bottomRight]
      top = upper_left[:y]
      right = bottom_right[:x]
      bottom = bottom_right[:y]
      left = upper_left[:x]
      new name: key, top: top, right: right, bottom: bottom, left: left
    end
  end
end
