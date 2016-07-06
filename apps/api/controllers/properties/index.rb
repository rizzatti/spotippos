module Api::Controllers::Properties
  class Index
    include Api::Action

    params do
      param :ax, presence: true, type: Integer, inclusion: 0..1400
      param :ay, presence: true, type: Integer, inclusion: 0..1000
      param :bx, presence: true, type: Integer, inclusion: 0..1400
      param :by, presence: true, type: Integer, inclusion: 0..1000
    end

    def call(params)
      halt 400, '' unless params.valid?
    end
  end
end
