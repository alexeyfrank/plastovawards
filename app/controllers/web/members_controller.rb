class Web::MembersController < Web::ApplicationController
  
  def index
    header_img :participation
    @members = Member.all
  end
  
  def new
    header_img :participation
    @member = Member.new
    4.times { @member.pictures.build }
  end

  def create
    header_img :participation
    @member = Member.new params[:member]
    if @member.save
      flash[:notice] = "Thank for your request!"
      redirect_to new_member_path
    else
      flash[:notice] = "Got some errors!"
      render :new
    end
  end
end
