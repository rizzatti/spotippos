module Api::Controllers::Properties
  class Index
    include Api::Action

    expose :properties, :provinces

    params do
      param :ax, presence: true, type: Integer, inclusion: 0..1400
      param :ay, presence: true, type: Integer, inclusion: 0..1000
      param :bx, presence: true, type: Integer, inclusion: 0..1400
      param :by, presence: true, type: Integer, inclusion: 0..1000
    end

    def call(params)
      halt 400, '' unless params.valid?
      top = params[:ay]
      right = params[:bx]
      bottom = params[:by]
      left = params[:ax]
      properties = PropertyRepository.find_within_coordinates(top, right,
                                                              bottom, left)
      @properties = properties.map {|e| PropertyDecorator.new e }
      @provinces = ProvinceRepository.all
    end
  end
end
