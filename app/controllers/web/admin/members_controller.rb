class Web::Admin::MembersController < Web::Admin::ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find params[:id]
  end

  def edit
    @member = Member.find params[:id]
  end

  def update
  end

  def destroy
    @member = Member.find params[:id]
    @member.delete
    flash[:notice] = "Member has successfully deleted!"
    redirect_to admin_members_path
  end
end
