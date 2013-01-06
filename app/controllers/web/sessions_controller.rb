class Web::SessionsController < Web::ApplicationController

  layout "web/admin/login"

  def new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      sign_in @user
      flash[:notice] = I18n.t 'views.sessions.user_successfully_logged_in'
      redirect_to admin_root_path
    else
      flash[:error] = I18n.t 'views.sessions.invalid_email_or_password'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path
  end
end
