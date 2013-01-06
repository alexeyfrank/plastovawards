module Web::AuthHelper

  def authenticate_user
    redirect_to new_session_path unless signed_in?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    session[:user_id] && current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
