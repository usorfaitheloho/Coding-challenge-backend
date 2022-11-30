class Api::V1::SectorsController < ApplicationController
    def index
        @sectors = Sector.all
        render json: {sectors: @sectors }.to_json,status: :ok 
    end

    def create
        @sector = Sector.new(sector_params)

        if @sector.save
            render json: {
                message: 'Details added successfully'
            }, status: :ok

        else
            render json: {
                message: 'Something went wrong'
            }, status: :unprocessable_entity
        end
    end

    def show
        @sector = Sector.find(params[:id])
        render json: {sector: @sector}.to_json, status: :created
    end

    def update
        @sector = Sector.find(params[:id])
        @sector.update(
            sector_name: params[:sector_name],
            user_name: params[:user_name],
            agree: params[:agree]
        )
        render json: @sector
    end

    def destroy
        @sectors = Sector.all
        @sector = Sector.find(params[:id])
        @sector.destroy
        render json: @sectors
    end
    
    def sector_params
        params.require(:sector).permit(:sector_name, :user_name, :agree)
    end

end
