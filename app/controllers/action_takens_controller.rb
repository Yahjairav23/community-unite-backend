class ActionTakensController < ApplicationController

    def index
        actions = ActionTaken.all 

        render json: actions.to_json()
    end

    def show
        action = ActionTaken.find(params[:id])

        render json: action.to_json(include: [:oversight_agency, :escalation])
    end

    def create
        action = ActionTaken.create(date: Date.parse(params[:date]), escalation_id: params[:escalation_id], oversight_agency_id: params[:oversight_agency_id], description: params[:description])
        render json: action.to_json()
    end
end
