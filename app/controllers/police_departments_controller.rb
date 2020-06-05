class PoliceDepartmentsController < ApplicationController
    def index
        pd = PoliceDepartment.all
        render json: pd
    end

    def show
        pd = PoliceDepartment.find(params[:id])
        render json: pd
    end
end
