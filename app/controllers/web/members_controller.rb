class Web::MembersController < Web::ApplicationController
  
  def index
    header_img :participation
    @years = Member.years
    @nominations = Nomination.published.all
    @q = Member.search(params[:q])
    @members = @q.result
  end
  
  def new
    header_img :participation
    @member = Member.new
    @member.pictures.build
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
