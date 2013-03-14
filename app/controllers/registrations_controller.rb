class RegistrationsController < Devise::RegistrationsController
  @user = current_user
  protected
  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
    thank_you_path
  end

  # The path used after sign up for inactive accounts. You need to overwrite
  # this method in your own RegistrationsController.
  def after_inactive_sign_up_path_for(resource)
    thank_you_path
  end

  def password_update
  end
end
