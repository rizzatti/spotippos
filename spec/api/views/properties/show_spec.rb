require 'spec_helper'
require_relative '../../../../apps/api/views/properties/show'

describe Api::Views::Properties::Show do
  let(:property)  { PropertyRepository.first }
  let(:provinces) { ProvinceRepository.all }
  let(:exposures) { Hash[property: property, provinces: provinces] }
  let(:template)  { Hanami::View::Template.new('apps/api/templates/properties/show.rabl') }
  let(:view)      { Api::Views::Properties::Show.new(template, exposures) }
  let(:rendered)  { view.render }
  let(:rendered_property) { Property.create JSON.load(rendered) }

  it 'exposes #property' do
    view.property.must_equal exposures.fetch(:property)
  end

  it 'exposes #provinces' do
    assert_equal(view.provinces, exposures.fetch(:provinces))
  end

  it 'responds in json' do
    assert_equal(rendered_property, property)
  end
end
