class PropertyRepository
  include Hanami::Repository

  def self.find_within_coordinates(top, right, bottom, left)
    query do
      where(['x <= ? and x >= ? and y >= ? and y <= ?',
             top, bottom, left, right])
    end.all
  end
end
