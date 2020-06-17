class Api::V1::OversightAgenciesController < ApplicationController
    
    def index
        agencies = OversightAgency.all

        render json: agencies.as_json(except: [:password_digest], include: {escalations: {include: [:action_takens]}})
    end

    def show
        agency = OversightAgency.find(params[:id])

        render json: agency.as_json(except: [:password_digest], include: {escalations: {include: [:action_takens]}})
    end

    def profile
        token = request.headers['Authenticate']
        user = OversightAgency.find(decode(token)['user_id'])

        render json: user.as_json(except: [:password_digest], include: {escalations: {include: [:action_takens]}})
    end
end
