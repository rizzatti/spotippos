require 'spec_helper'
require_relative '../../../../apps/api/controllers/properties/create'

describe Api::Controllers::Properties::Create do
  let(:action) { Api::Controllers::Properties::Create.new }
  let(:good_params) do
    { title: 'House', description: 'A nice house', price: 100_000.00,
      x: 100, y: 200, beds: 3, baths: 2, squareMeters: 120 }
  end
  let(:missing_params) { Hash[] }
  let(:bad_params) { good_params.update(beds: 10) }

  it 'is successful' do
    response = action.call(good_params)
    assert_equal(201, response[0])
  end

  it 'adds a new property to DB on successful' do
    old_count = PropertyRepository.all.size
    action.call(good_params)
    assert_equal(PropertyRepository.all.size, old_count + 1)
  end

  it 'it fails with missing params' do
    response = action.call(missing_params)
    assert_equal(400, response[0])
  end

  it 'it fails with bad params' do
    response = action.call(bad_params)
    assert_equal(400, response[0])
  end
end
