require 'time'

class ReportsController < ApplicationController
    def index 
        reports = Report.all
        render json: reports.as_json(include: [:police, :citizen, escalation: {include: [:action_takens]}])
    end

    def escalations
        escalated_reports = Escalation.all.map{ |escalation| escalation.report }
        render json: escalated_reports.as_json()
    end

    def show
        report = Report.find(params[:id])
        render json: report.as_json(include: [:police, :citizen, escalation: {include: [:action_takens]}])
    end


    def create
        if (params[:reportObj][:reportDetails][:encounterAddress2])
            address = params[:reportObj][:reportDetails][:encounterAddress]+" "+params[:reportObj][:reportDetails][:encounterAddress2]
        else
            address = params[:reportObj][:reportDetails][:encounterAddress]
        end

        time = Time.parse(params[:reportObj][:reportDetails][:currentTime])
        report = Report.create(
            police_id: params[:reportObj][:police_id],
            citizen_id: params[:reportObj][:citizen_id],
            location: address,
            time: time,
            city: params[:reportObj][:reportDetails][:city],
            state: params[:reportObj][:reportDetails][:state],
            date: Date.parse(params[:reportObj][:reportDetails][:date]),
            arrest: params[:reportObj][:reportDetails][:arrestMade]==true,
            force_used: params[:reportObj][:reportDetails][:forceUsed]==true,
            reason: params[:reportObj][:reportDetails][:reason],
            incident_description: params[:reportObj][:reportDetails][:description],
            resolution: params[:reportObj][:reportDetails][:resolution]
        )

        citizen = Citizen.find(params[:reportObj][:citizen_id])
        
        citizen_obj = Hash.new

        if (params[:reportObj][:reportDetails][:citizenAddress2])
            citizen_obj[:address] = params[:reportObj][:reportDetails][:citizenAddress]+" "+params[:reportObj][:reportDetails][:encounterAddress2]
        else
            citizen_obj[:address] = params[:reportObj][:reportDetails][:citizenAddress]
        end
        if (params[:reportObj][:reportDetails][:citizenName])
            citizen_obj[:name] = params[:reportObj][:reportDetails][:citizenName]
        end
        if (params[:reportObj][:reportDetails][:citizenPhoneNumber])
            citizen_obj[:phone_number] = params[:reportObj][:reportDetails][:citizenPhoneNumber]
        end
        if (params[:reportObj][:reportDetails][:citizenEmail])
            citizen_obj[:email] = params[:reportObj][:reportDetails][:citizenEmail]
        end
        if (params[:reportObj][:reportDetails][:citizenCity])
            citizen_obj[:city] = params[:reportObj][:reportDetails][:citizenCity]
        end
        if (params[:reportObj][:reportDetails][:citizenState])
            citizen_obj[:state] = params[:reportObj][:reportDetails][:citizenState]
        end
        
        citizen.update(citizen_obj)

        render json: report.to_json(include: [:police, :citizen])
    end

    def update
        report = Report.find(params[:id])
        report.comments = report.comments.push(params[:comment])
        report.save
        
        render json: report.to_json(include: [:police, :citizen, escalation: {include: [:action_takens]}])
    end

end
