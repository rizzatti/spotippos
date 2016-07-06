require 'spec_helper'
require_relative '../../../../apps/api/controllers/properties/show'

describe Api::Controllers::Properties::Show do
  before do
    property = Property.new title: 'Test', description: 'Test property',
      price: 50_000, x: 10, y: 20, beds: 1, baths: 1, square_meters: 50
    property = PropertyRepository.create(property)
    @id = property.id
  end

  let(:action) { Api::Controllers::Properties::Show.new }
  let(:existing_params) { Hash[:id, @id] }
  let(:non_existing_params) { Hash[:id, @id + 1] }
  let(:missing_params) { Hash[] }

  it 'is successful with an existing id' do
    response = action.call(existing_params)
    assert_equal(200, response[0])
  end

  it 'fails with non existing id' do
    response = action.call(non_existing_params)
    assert_equal(400, response[0])
  end

  it 'fails with missing params' do
    response = action.call(missing_params)
    assert_equal(400, response[0])
  end
end
