module Api::Controllers::Properties
  class Show
    include Api::Action

    params do
      param :id, presence: true
    end

    def call(params)
      return status 400, '' unless params.valid?
      @property = PropertyRepository.find params[:id]
      return status 400, '' unless @property
    end
  end
end
