class Api::V1::PoliceController < ApplicationController
    def index
        police = Police.all
        render json: police.to_json(include: :reports)
    end

    def profile
        token = request.headers['Authenticate']
        user = Police.find(decode(token)['user_id'])
        
        render json: user.to_json(include: :reports)
    end

    def show
        police = Police.find(params[:id])
        render json: police .to_json(include: :reports)
    end
end
