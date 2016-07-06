require 'spec_helper'
require_relative '../../../../apps/api/views/properties/index'

describe Api::Views::Properties::Index do
  before do
    PropertyRepository.clear
    p1 = Property.new title: 'Property 1', price: 10, beds: 1, baths: 1,
      square_meters: 50, x: 10, y: 10
    p2 = Property.new title: 'Property 2', price: 10, beds: 1, baths: 1,
      square_meters: 50, x: 20, y: 20
    PropertyRepository.create p1
    PropertyRepository.create p2
  end

  let(:properties) { PropertyRepository.all }
  let(:decorated_properties) { properties.map {|e| PropertyDecorator.new e } }
  let(:provinces) { ProvinceRepository.all }
  let(:exposures) { Hash[properties: decorated_properties, provinces: provinces] }
  let(:template)  { Hanami::View::Template.new('apps/api/templates/properties/index.json.rabl') }
  let(:view)      { Api::Views::Properties::Index.new(template, exposures) }
  let(:rendered)  { view.render }
  let(:rendered_json) { JSON.load rendered }

  it 'exposes #properties' do
    assert_equal(exposures.fetch(:properties), view.properties)
  end

  it 'exposes #provinces' do
    assert_equal(exposures.fetch(:provinces), view.provinces)
  end

  describe 'JSON' do
    it 'has a foundProperties field' do
      assert(rendered_json.key? 'foundProperties')
    end

    it 'has a properties field' do
      assert(rendered_json.key? 'properties')
    end

    it 'shows the correct number of found properties' do
      assert_equal(2, rendered_json['foundProperties'])
    end

    it 'lists the correct number of found properties' do
      assert_equal(2, rendered_json['properties'].size)
    end
  end
end
