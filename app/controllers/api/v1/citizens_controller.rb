class Api::V1::CitizensController < ApplicationController
    
    def index 
        citizens = Citizen.all
        render json: citizens.to_json(except: [:password_digest], include: :reports)
    end
    
    def profile
        token = request.headers['Authenticate']
        user = Citizen.find(decode(token)['user_id'])
        # byebug
        render json: user.to_json(except: [:password_digest], include: :reports)
    end

    def search
        citizen = Citizen.find_or_create_by(state_id: params[:citizenId])
        render json: citizen.to_json(except: [:password_digest],)
    end

    def show
        citizen = Citizen.find(params[:id])
        render json: citizen.to_json(except: [:password_digest], include: :reports)
    end

    def create
        citizen = Citizen.create(citizen_params)
        render json: citizen.to_json(except: [:password_digest], include: :reports)
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
