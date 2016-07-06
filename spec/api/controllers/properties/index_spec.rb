require 'spec_helper'
require_relative '../../../../apps/api/controllers/properties/index'

describe Api::Controllers::Properties::Index do
  let(:action) { Api::Controllers::Properties::Index.new }
  let(:good_params) { Hash[ax: 0, ay: 100, bx: 100, by: 0] }
  let(:missing_params) { Hash[] }
  let(:bad_numeric_params) { good_params.update(bx: 1500) }

  it 'is successful' do
    response = action.call(good_params)
    assert_equal(200, response[0])
  end

  it 'fails with missing params' do
    response = action.call(missing_params)
    assert_equal(400, response[0])
  end

  it 'fails with bad numeric params' do
    response = action.call(bad_numeric_params)
    assert_equal(400, response[0])
  end
end
