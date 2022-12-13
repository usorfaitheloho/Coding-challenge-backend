class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_admin!
  def create
    @user = User.new(user_params)

    if params[:user][:agree] == false
      render json: {
        message: 'You should agree to our terms'
      }, status: :unprocessable_entity
    elsif @user.save
      render json: {
        message: 'Details added successfully'
      }, status: :ok

    else
      render json: {
        message: 'Something went wrong'
      }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(
      name: params[:name],
      sector_name: params[:sector_name],
      agree: params[:agree]
    )
    render json: @user
  end

  def show
    @user = User.find(params[:id])
    render json: { user: @user }.to_json, status: :created
  end

  def user_params
    params.require(:user).permit(:name, :sector_name, :agree)
  end
end
