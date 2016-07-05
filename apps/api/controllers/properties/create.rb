module Api::Controllers::Properties
  class Create
    include Api::Action

    params do
      param :title, presence: true
      param :description, presence: true
      param :price, presence: true
      param :x, presence: true
      param :y, presence: true
      param :beds, presence: true
      param :baths, presence: true
      param :squareMeters, presence: true
    end

    def call(params)
      halt 400, '' unless params.valid?
      property = Property.create params
      PropertyRepository.create property
      status 201, ''
    rescue ArgumentError
      halt 400, ''
    end
  end
end
