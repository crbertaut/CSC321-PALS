class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:interests, :home_phone, :dob, :name, :email, :password, :password_confirmation, :person, :street_address, :city, :state, :organization])
    devise_parameter_sanitizer.permit(:account_update, keys: [:home_phone, :dob, :name, :email, :password, :password_confirmation, :interests, :avatar, :person, :bio, :street_address, :city, :state, :organization])
  end
  
  def check_for_mobile
    session[:mobile_override] = params[:mobile] if params[:mobile]
    prepare_for_mobile if mobile_device?
  end

  def prepare_for_mobile
    prepend_view_path Rails.root + 'app' + 'views_mobile'
  end
  
  def application
    @current_user = current_user
  end

  def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == "1"
    else
      (request.user_agent =~ /(iPhone|iPod|Android|Mobile|webOS)/) && (request.user_agent !~ /iPad/)
    end
  end
  helper_method :mobile_device?
end
