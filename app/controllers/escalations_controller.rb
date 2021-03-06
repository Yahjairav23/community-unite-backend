class EscalationsController < ApplicationController
    def index
        escalations = Escalation.all 
        render json: escalations.as_json(include: [:action_takens]) 
    end

    def show
        escalation = Escalation.find(params[:id])

        render json: escalation.as_json(include: [:action_takens])
    end

    def create
        escalation = Escalation.create(report_id: params[:report_id], date: Date.new(), reason: params[:reason])

        render json: escalation.as_json(include: [:action_takens])
    end

    def update
        escalation = Escalation.find(params[:id])
        escalation.status = params[:status]
        escalation.save
        render json: escalation.as_json(include: [:action_takens])
    end
end
