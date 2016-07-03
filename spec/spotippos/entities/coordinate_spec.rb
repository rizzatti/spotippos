require 'spec_helper'

describe Coordinate do
  describe 'default attributes' do
    let(:subject) { Coordinate.new }

    it 'has a x coordinate with 0 value' do
      assert_equal(subject.x, 0)
    end

    it 'has a y coordinate with 0 value' do
      assert_equal(subject.y, 0)
    end
  end

  describe 'constructor' do
    let(:subject) { Coordinate.new 10, 500 }

    it 'has a x value of 10' do
      assert_equal(subject.x, 10)
    end

    it 'has a y value of 500' do
      assert_equal(subject.y, 500)
    end
  end

  describe 'attributes coercion' do
    let(:subject) { Coordinate.new '20', 500.5 }

    it 'has a x value of 20' do
      assert_equal(subject.x, 20)
    end

    it 'has a y value of 500' do
      assert_equal(subject.y, 500)
    end
  end

  describe 'attributes rules' do
    it 'does not allow x lower than 0' do
      assert_raises(ArgumentError) { Coordinate.new(-1, 0) }
    end

    it 'does not allow x greater than 1400' do
      assert_raises(ArgumentError) { Coordinate.new(1401, 0) }
    end

    it 'does not allow y lower than 0' do
      assert_raises(ArgumentError) { Coordinate.new(0, -1) }
    end

    it 'does not allow y greater than 1000' do
      assert_raises(ArgumentError) { Coordinate.new(0, 1001) }
    end
  end
end
