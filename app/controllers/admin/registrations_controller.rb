# frozen_string_literal: true

class Admin::RegistrationsController < Devise::RegistrationsController

  respond_to :json
 

  # private

  
  # def respond_with(_resource, _opts = {})
  #   register_success && return if resource.persisted?

  #   register_failed
  # end

  # def register_success
  #   render json: {
  #     message: 'Signed up successfully',
  #     admin: current_admin,
  #     status: 200
  #   }, status: :ok
  # end

  # def register_failed
  #   render json: {
  #     message: 'Somehing went wrong',
  #     status: 401
  #   }, status: :unprocessable_entity
  # end

  # def register_success
  #   render json: {
  #     message: 'Signed up successfully',
  #     user: current_user,
  #     status: 200
  #   }, status: :ok
  # end

  # def register_failed
  #   render json: {
  #     message: 'Somehing went wrong',
  #     status: 401
  #   }, status: :unprocessable_entity
  # end

  def new
    @admin = current_admin[:admin_id]
  end

  def create
    admin = Admin.create!(
      email: params['email'],
      password: params['password'],
      password_confirmation: params['password_confirmation']
    )
    if admin
      session[:admin_id] = admin.id
      render json:{
        status: :created,
        admin: current_admin
      }
    else
      render json: { status: :unprocessable_entity}
    end
  end

end
