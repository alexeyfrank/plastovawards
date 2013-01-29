class Web::Admin::MembersController < Web::Admin::ApplicationController
  def index
    @members = Member.includes(:pictures).all
  end

  def show
    @member = Member.find params[:id]
  end

  def edit
    # @bid_states = BidState.all
    # @competition_states = CompetitionState.all
    @member = Member.includes(:pictures).find params[:id]
    @member.pictures.each do |p|
      if p.file.url.blank?
        p.delete
      end
    end
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
