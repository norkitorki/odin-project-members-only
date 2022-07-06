class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(resource)
    edit_user_registration_path if resource.is_a?(User)
  end
end
