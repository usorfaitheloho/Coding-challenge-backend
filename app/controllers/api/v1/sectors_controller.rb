class Api::V1::SectorsController < ApplicationController
  # skip_before_action :authenticate_admin!

  def index
    @sectors = Sector.all
    render json: { sectors: @sectors }.to_json, status: :ok
  end

  def update
    @sector = Sector.find(params[:id])
    @sector.update(
      sector_name: params[:sector_name]
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
    params.require(:sector).permit(:sector_name)
  end
end
