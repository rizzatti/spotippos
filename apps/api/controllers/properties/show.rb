module Api::Controllers::Properties
  class Show
    include Api::Action

    expose :property, :provinces

    params do
      param :id, presence: true
    end

    def call(params)
      halt 400, '' unless params.valid?
      @property = PropertyRepository.find params[:id]
      @provinces = ProvinceRepository.all
      halt 400, '' unless @property
    end
  end
end
