require 'spec_helper'

describe Province do
  describe 'default attributes' do
    let(:subject) { Province.new 'São Paulo', [nil, nil] }

    it 'has a name' do
      assert_equal(subject.name, 'São Paulo')
    end

    it 'has boundaries' do
      assert_equal(subject.boundaries, [nil, nil])
    end
  end

  describe 'attribute rules' do
    it 'requires a non empty name' do
      assert_raises(ArgumentError) { Province.new '', [nil, nil] }
    end

    it 'requires a size 2 array of boundaries' do
      assert_raises(ArgumentError) { Province.new 'teste', nil }
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
