module ApplicationHelper
    
  # Code from 'https://stackoverflow.com/questions/14234706/rails-3-2-devise-custom-authenticate-user-that-authenticates-users-and-admin'
  def auth_user!(opts = {})
    if admin_user_signed_in?
      authenticate_admin_user!
    else
      authenticate_user!
    end
  end

end
