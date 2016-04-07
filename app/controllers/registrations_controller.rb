class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    Profile.create(:user_id => resource.id)
    new_profile_path
  end
end
