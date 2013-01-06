class Web::Admin::UsersController < Web::Admin::ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      flash[:notice] = "User successfully added!"
    end
    render :new
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes params[:user]
      flash[:notice] = "User successfully updated"
    end
    render :edit
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to admin_users_path
  end
end
