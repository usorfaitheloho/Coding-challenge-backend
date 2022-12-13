class SectorsController < ApplicationController
  
  def index
    @sectors = Sector.all
    render json: @sectors
  end

  def show
    @sector = Sectors.find(params[:id])
    render json: @sector
  end

  def create
    @sector = Sector.create(
      sector_name: params[:sector_name],
      user_name: params[:user_name],
      agree: params[:agree]
    )
    render json: @sector
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
end
