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
    @member = Member.find params[:id]
    if @member.update_attributes params[:member]
      flash[:notice] = "Member has successfully updated"
      redirect_to edit_admin_member_path(@member)
    else
      flash[:error] = "Got some errors"
      render :edit
    end
  end

  def destroy
    @member = Member.find params[:id]
    @member.delete
    flash[:notice] = "Member has successfully deleted!"
    redirect_to admin_members_path
  end
end
