class RegistrationsController < Devise::RegistrationsController

  before_action :four_admins_registered?, only: [:new, :create]
  
  protected

  def four_admins_registered?
    if ((Admin.count == 4) & (admin_signed_in?))
      redirect_to root_path
    elsif Admin.count == 4
      redirect_to new_admin_session_path
    end  
  end

end