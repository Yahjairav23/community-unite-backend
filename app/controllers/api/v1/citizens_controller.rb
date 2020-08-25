class Api::V1::CitizensController < ApplicationController
    
    def index 
        citizens = Citizen.all
        render json: citizens.to_json(except: [:password_digest], include: :reports)
    end
    
    def profile
        token = request.headers['Authenticate']
        user = Citizen.find(decode(token)['user_id'])
        render json: user.to_json(except: [:password_digest], include: :reports)
    end

    def search
        if Citizen.where(:state_id => params[:citizenId]).exists?
            citizen = Citizen.find_by(state_id: params[:citizenId]) 
        else
            citizen = Citizen.create(state_id: params[:citizenId], email: params[:citizenId], password: params[:citizenId])
        end
        
        render json: citizen.to_json(except: [:password_digest])
    end

    def show
        citizen = Citizen.find(params[:id])
        render json: citizen.to_json(except: [:password_digest], include: :reports)
    end

    def create
        # a fetch call to this method need to be made in order to create a new user instance
        # Check to see if the user's state id is in the system first
        citizen_found = Citizen.find_by(state_id: params[:state_id])
        # if(citizen_found)
            # if yes, we need to do an update instance with the new info
        # else
            # if not, create new instance
            @citizen = Citizen.create(citizen_params)
        # end
        render json: @citizen.to_json(except: [:password_digest], include: :reports)
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
