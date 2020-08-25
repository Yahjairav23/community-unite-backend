class Api::V1::AuthController < ApplicationController

    def create
        #find user using params
        @user_type = params[:userType]
        if(@user_type == 'citizen')
            @user = Citizen.find_by(email: params[:email])
        elsif(@user_type == 'police')
            @user = Police.find_by(badge_number: params[:badge_number])
        elsif(@user_type == 'oversightAgency')
            @user = OversightAgency.find_by(email: params[:email])
        end
        
        if(@user && @user.authenticate(params[:password]))
            payload = {user_id: @user.id}
            token = encode(payload)
            new_hash = {}
            new_hash['user_data'] = @user
            new_hash['token'] = token
            render json: new_hash
        else
            render json: {
                error_message: 'Incorrect username or password'
            }
        end
    end
end
