# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :username, :first_name, :last_name, :photo, :photo_cache)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :username, :first_name, :last_name, :photo, :photo_cache, :current_password)
  end

end
