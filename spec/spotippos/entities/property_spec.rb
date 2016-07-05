require 'spec_helper'

describe Property do
  describe 'default attributes' do
    let(:subject) { Property.new }

    it 'has an empty title' do
      assert_equal(subject.title, '')
    end

    it 'has a null price' do
      assert_equal(subject.price, nil)
    end

    it 'has an empty description' do
      assert_equal(subject.description, '')
    end

    it 'has a x coordinate with value 0' do
      assert_equal(subject.x, 0)
    end

    it 'has a y coordinate with value 0' do
      assert_equal(subject.y, 0)
    end

    it 'has 1 beds' do
      assert_equal(subject.beds, 1)
    end

    it 'has 1 baths' do
      assert_equal(subject.baths, 1)
    end

    it 'has a 20 square meters' do
      assert_equal(subject.square_meters, 20)
    end
  end

  describe 'attribute rules' do
    it 'does not allow x lower than 0' do
      assert_raises(ArgumentError) { Property.new x: -1 }
    end

    it 'does not allow x greater than 1400' do
      assert_raises(ArgumentError) { Property.new x: 1401 }
    end

    it 'does not allow y lower than 0' do
      assert_raises(ArgumentError) { Property.new y: -1 }
    end

    it 'does not allow y greater than 1000' do
      assert_raises(ArgumentError) { Property.new y: 1001 }
    end

    it 'does not accept beds lower than 1' do
      assert_raises(ArgumentError) { Property.new beds: 0 }
    end

    it 'does not accept beds higher than 5' do
      assert_raises(ArgumentError) { Property.new beds: 6 }
    end

    it 'does not accept baths lower than 1' do
      assert_raises(ArgumentError) { Property.new baths: 0 }
    end

    it 'does not accept baths higher than 4' do
      assert_raises(ArgumentError) { Property.new baths: 5 }
    end

    it 'does not accept square meters lower than 20' do
      assert_raises(ArgumentError) { Property.new square_meters: 10 }
    end

    it 'does not accept square meters higher than 240' do
      assert_raises(ArgumentError) { Property.new square_meters: 250 }
    end
  end

  describe 'create in batches' do
    let(:subject) do
      Property.create_in_batches({
        'properties' => [{ 'squareMeters' => 150 }]
      }).first
    end

    it 'creates with the correct square meters' do
      assert_equal(subject.square_meters, 150)
    end
  end

  describe 'create' do
    let(:subject) do
      Property.create({'squareMeters' => 150 })
    end

    it 'creates with the correct square meters' do
      assert_equal(subject.square_meters, 150)
    end
  end
end
