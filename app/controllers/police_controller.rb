class PoliceController < ApplicationController
    def index
        police = Police.all
        render json: police
    end

    def show
        police = Police.find(params[:id])
        render json: police 
    end
end
