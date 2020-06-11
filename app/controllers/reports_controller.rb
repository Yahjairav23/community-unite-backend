class ReportsController < ApplicationController
    def index 
        reports = Report.all
        render json: reports 
    end

    def show
        report = Report.find(params[:id])
        render json: report.to_json(include: [:police, :citizen])
    end

    def create
        if (params[:reportObj][:reportDetails][:encounterAddress2])
            address = params[:reportObj][:reportDetails][:encounterAddress]+" "+params[:reportObj][:reportDetails][:encounterAddress2]
        else
            address = params[:reportObj][:reportDetails][:encounterAddress]
        end
        report = Report.create(
            police_id: params[:reportObj][:police_id],
            citizen_id: params[:reportObj][:citizen_id],
            location: address,
            time: (new Time(params[:reportObj][:currentTime])),
            # location: params[:reportObj][:reportDetails][:encounterAddress]+" "+params[:reportObj][:reportDetails][:encounterAddress2],
            city: params[:reportObj][:reportDetails][:city],
            state: params[:reportObj][:reportDetails][:state],
            date: Date.parse(params[:reportObj][:reportDetails][:date]),
            arrest: params[:reportObj][:reportDetails][:arrestMade]=="true",
            force_used: params[:reportObj][:reportDetails][:forceUsed]=="true",
            reason: params[:reportObj][:reportDetails][:reason],
            incident_description: params[:reportObj][:reportDetails][:description],
            resolution: params[:reportObj][:reportDetails][:resolution]
        )
        render json: report.to_json(include: [:police, :citizen])
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
