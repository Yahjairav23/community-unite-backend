class PoliceController < ApplicationController
    def index
        police = Police.all
        render json: police.to_json(include: :reports)
    end

    def show
        police = Police.find(params[:id])
        render json: police .to_json(include: :reports)
    end
end
