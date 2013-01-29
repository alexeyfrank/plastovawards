class Web::MembersController < Web::ApplicationController
  
  def index
    @layout_title = I18n.t l_title
    header_img "members-gallery"
    @years = Member.years
    @nominations = Nomination.published.all
    @q = Member.published.includes(:pictures).search(params[:q])
    @members = @q.result
  end
  
  def new
    @layout_title = I18n.t l_title
    header_img "members-gallery"
    @member = Member.new
    @member.pictures.build
  end
  
  def show
    header_img "members-gallery"
    @member = Member.includes(:pictures).find params[:id]
    @layout_title = @member.fio
  end

  def create
    @layout_title = I18n.t l_title
    header_img "members-gallery"
    @member = Member.new params[:member]
    if @member.save
      flash[:notice] = t('web.members.new_member_success_msg')
      redirect_to new_member_path
    else
      render :new
    end
  end
  
  def upload_avatar
    file = params[:qqfile].is_a?(ActionDispatch::Http::UploadedFile) ? params[:qqfile] : params[:file]
    uploader = MemberAvatarUploader.new
    uploader.store!(file)
    respond_to do |format|
      format.json {
        render :json => {
          success: true,
          file: uploader.url
        }
      }
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
