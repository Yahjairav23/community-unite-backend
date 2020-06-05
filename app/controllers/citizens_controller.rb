class CitizensController < ApplicationController
    def index 
        citizens = Citizen.all
        render json: citizens
    end

    def show
        citizen = Citizen.find(params[:id])
        render json: citizen
    end

    def create
        citizen = Citizen.create(citizen_params)
        render json: citizen 
    end

    
    private

    def citizen_params
        params.require(:citizen).permit(
            :name,
            :address,
            :city,
            :state,
            :phone_number,
            :email,
            :birthday,
            :gender,
            :race,
            :state_id
        )
    end
end