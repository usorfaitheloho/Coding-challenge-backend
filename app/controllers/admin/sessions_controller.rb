class Admin::SessionsController < Devise::SessionsController
  respond_to :json
  # private

  def set_current_admin
    if session[:admin_id]
      @current_admin = Admin.find(session[:admin_id])
    else
      render json: { status: :unprocessable_entity }
    end
  end

  def create
    admin = Admin.find_by(email: params[:email])

    if admin.present?
      session[:admin_id] = admin.id
      render json: {
        status: 200,
        sign_in: true,
        admin:
      }
    else
      render json: { status: 401 }
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
    render json: { status: 200, sign_out: true }
  end
end
