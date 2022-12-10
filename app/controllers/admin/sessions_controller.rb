# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  respond_to :json 
  private

  # def respond_with(_resource, _opts = {})
  #   login_success && return if current_user

  #   login_failed
  # end

  # def login_success
  #   render json: {
  #     message: 'You are logged In',
  #     user: current_user,
  #     token: request.env['warden-jwt_auth.token'],
  #     status: 200
  #   }, status: :ok
  # end

  # def login_failed
  #   render json: {
  #     message: 'Invalid login credentials',
  #     status: 401
  #   }, status: :unprocessable_entity
  # end

  # def respond_to_on_destroy
  #   log_out_success && return if current_user

  #   log_out_failure
  # end

  # def log_out_success
  #   render json: {
  #     message: 'You are logged out',
  #     status: 204
  #   }, status: :ok
  # end

  # def log_out_failure
  #   render json: {
  #     message: 'something went wrong'
  #   }, status: :unauthorized
  # end
  # include CurrentAdminConcern

  before_action :set_current_admin
  


def set_current_admin
    if session[:admin_id]
        @current_admin = Admin.find(session[:admin_id])
     else
        render json: { status: :unprocessable_entity}
    end
end

  def create
    admin = Admin
                .find_by(email: params["email"])
                .try(:authenticate, params["password"])
    if admin
      session[:admin_id] = admin.id
      render json:{
        status: :created,
        sign_in: true,
        admin: admin
      }
    else
      render json: { status: :unprocessable_entity}
    end
  end

  def sign_in
    if @current_admin
      render json: {
        sign_in: true,
        admin: @current_admin
      }
    else 
      render json: {
        sign_in: false
      }
    end
  end

  def sign_out
    reset_session
    render json: { status: 200, sign_out: true  }
  end 

end
