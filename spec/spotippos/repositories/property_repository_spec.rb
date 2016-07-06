require 'spec_helper'

describe PropertyRepository do
  before do
    PropertyRepository.clear
    p1 = Property.new title: 'Property 1', price: 10, beds: 1, baths: 1,
      square_meters: 50, x: 10, y: 10
    p2 = Property.new title: 'Property 2', price: 10, beds: 1, baths: 1,
      square_meters: 50, x: 20, y: 20
    PropertyRepository.create p1
    PropertyRepository.create p2
  end

  describe '#find_within_coordinates' do
    it 'finds 2 properties accordingly' do
      properties = PropertyRepository.find_within_coordinates(30, 30, 0, 0)
      assert_equal(2, properties.size)
    end

    it 'finds 1 properties accordingly' do
      properties = PropertyRepository.find_within_coordinates(15, 15, 0, 0)
      assert_equal(1, properties.size)
    end

    it 'finds 0 properties accordingly' do
      properties = PropertyRepository.find_within_coordinates(5, 5, 0, 0)
      assert_equal(0, properties.size)
    end
  end
end
