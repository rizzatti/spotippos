require 'spec_helper'
require_relative '../../../../apps/api/views/properties/show'

describe Api::Views::Properties::Show do
  let(:property)  do
    Property.new title: 'Test', description: 'Test property', price: 10_000.00,
      x: 10, y: 20, beds: 1, baths: 1, square_meters: 50
  end
  let(:decorated_property) { PropertyDecorator.new property }
  let(:provinces) { ProvinceRepository.all }
  let(:exposures) { Hash[property: decorated_property, provinces: provinces] }
  let(:template)  { Hanami::View::Template.new('apps/api/templates/properties/show.json.rabl') }
  let(:view)      { Api::Views::Properties::Show.new(template, exposures) }
  let(:rendered)  { view.render }
  let(:rendered_json) { JSON.load(rendered) }

  it 'exposes #property' do
    view.property.must_equal exposures.fetch(:property)
  end

  it 'exposes #provinces' do
    assert_equal(view.provinces, exposures.fetch(:provinces))
  end

  describe 'JSON' do
    it 'has an id field' do
      assert(rendered_json.key? 'id')
    end

    it 'has a title field' do
      assert(rendered_json.key? 'title')
    end

    it 'has a description field' do
      assert(rendered_json.key? 'description')
    end

    it 'has a price field' do
      assert(rendered_json.key? 'price')
    end

    it 'has a x field' do
      assert(rendered_json.key? 'x')
    end

    it 'has a y field' do
      assert(rendered_json.key? 'y')
    end

    it 'has a beds field' do
      assert(rendered_json.key? 'beds')
    end

    it 'has a baths field' do
      assert(rendered_json.key? 'baths')
    end

    it 'has a squareMeters field' do
      assert(rendered_json.key? 'squareMeters')
    end

    it 'has a provinces field' do
      assert(rendered_json.key? 'provinces')
    end
  end
end
