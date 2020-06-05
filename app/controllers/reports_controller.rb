class ReportsController < ApplicationController
    def index 
        reports = Report.all
        render json: reports 
    end

    def show
        report = Report.find(params[:id])
        render json: report 
    end

    def create
        report = Report.create(report_params)
        render json: report 
    end


    private

    def report_params
        params.require(:report).permit(
            :police_id,
            :citizen_id,
            :location,
            :city,
            :state,
            :date,
            :arrest,
            :force_used,
            :reason,
            :incident_description,
            :resolution
        )
    end
end
