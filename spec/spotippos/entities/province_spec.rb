require 'spec_helper'

describe Province do
  describe 'default attributes' do
    let(:subject) { Province.new name: 'São Paulo' }

    it 'has a name' do
      assert_equal(subject.name, 'São Paulo')
    end

    it 'has a top' do
      assert_equal(subject.top, 0)
    end

    it 'has a right' do
      assert_equal(subject.right, 0)
    end

    it 'has a bottom' do
      assert_equal(subject.bottom, 0)
    end

    it 'has a left' do
      assert_equal(subject.left, 0)
    end
  end

  describe 'attribute rules' do
    it 'requires a non empty name' do
      assert_raises(ArgumentError) { Province.new name: '' }
    end

    it 'does not allow top lower than 0' do
      assert_raises(ArgumentError) { Province.new name: 'teste', top: -1 }
    end

    it 'does not allow top greater than 1000' do
      assert_raises(ArgumentError) { Province.new name: 'teste', top: 1001 }
    end

    it 'does not allow bottom lower than 0' do
      assert_raises(ArgumentError) { Province.new name: 'teste', bottom: -1 }
    end

    it 'does not allow bottom greater than 1000' do
      assert_raises(ArgumentError) { Province.new name: 'teste', bottom: 1001 }
    end

    it 'does not allow left lower than 0' do
      assert_raises(ArgumentError) { Province.new name: 'teste', left: -1 }
    end

    it 'does not allow left greater than 1400' do
      assert_raises(ArgumentError) { Province.new name: 'teste', left: 1401 }
    end

    it 'does not allow right lower than 0' do
      assert_raises(ArgumentError) { Province.new name: 'teste', right: -1 }
    end

    it 'does not allow right greater than 1400' do
      assert_raises(ArgumentError) { Province.new name: 'teste', right: 1401 }
    end
  end

  describe 'attributes coercion' do
    let(:subject) { Province.new name: :teste, top: '20', bottom: 500.5 }

    it 'has a name of teste' do
      assert_equal(subject.name, 'teste')
    end

    it 'has a top value of 20' do
      assert_equal(subject.top, 20)
    end

    it 'has a bottom value of 500' do
      assert_equal(subject.bottom, 500)
    end
  end

  describe 'create' do
    let(:options) do
      { 'São Paulo' => {
        'boundaries' => {
          'upperLeft' => {
            'x' => 0,
            'y' => 1000 },
          'bottomRight' => {
            'x' => 600,
            'y' => 500 }
        }
      }}
    end

    let(:subject) { Province.create(options).first }

    it 'creates the correct name' do
      assert_equal(subject.name, 'São Paulo')
    end

    it 'creates the correct left coordinate' do
      assert_equal(subject.left, 0)
    end

    it 'creates the correct top coordinate' do
      assert_equal(subject.top, 1000)
    end

    it 'creates the correct right coordinate' do
      assert_equal(subject.right, 600)
    end

    it 'creates the correct bottom coordinate' do
      assert_equal(subject.bottom, 500)
    end
  end
end
