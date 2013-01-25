class Web::MembersController < Web::ApplicationController
  
  def index
    header_img "members-gallery"
    @years = Member.years
    @nominations = Nomination.published.all
    @q = Member.includes(:pictures).search(params[:q])
    @members = @q.result
  end
  
  def new
    header_img "members-gallery"
    @member = Member.new
    @member.pictures.build
  end

  def create
    header_img "members-gallery"
    @member = Member.new params[:member]
    if @member.save
      flash[:notice] = t('web.members.new_member_success_msg')
      redirect_to new_member_path
    else
      render :new
    end
  end
  
  def upload
    file = params[:qqfile].is_a?(ActionDispatch::Http::UploadedFile) ? params[:qqfile] : params[:file]
    picture = MemberPicture.new file: file
    if picture.save
      respond_to do |format|
        format.json { render :json => {
            success: true, 
            picture: {
              id: picture.id,
              path: picture.file.url
            }
          }
        }
      end
    else
      respond_to do |format|
        format.json { render :json => {
            error: true
          }
        }    
      end
    end
  end
end
