class Admin::RegistrationsController < Devise::RegistrationsController
  respond_to :json

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
      render json: {
        status: :created,
        admin: current_admin
      }
    else
      render json: { status: :unprocessable_entity }
    end
  end
end
