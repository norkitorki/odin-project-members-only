class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    if resource.save
      sign_in(resource)
      redirect_to root_path, notice: 'Welcome! You are now logged in.'
    else
      flash.now[:alert] = 'User has not been created.'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if update_resource(resource, account_update_params)
      redirect_to root_path, notice: 'User has been successfully updated.'
    else
      flash.now[:alert] = 'User has not been updated.'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
end