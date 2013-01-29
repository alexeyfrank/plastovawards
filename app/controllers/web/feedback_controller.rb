class Web::FeedbackController < Web::ApplicationController
  def new
    @feed = Feedback.new
    header_img 'ask-question'
    @layout_title = I18n.t("views.feedback.title")
  end

  def create
    header_img 'ask-question'
    @layout_title = I18n.t("views.feedback.title")
    @feed = Feedback.new params[:feedback]
    if @feed.save 
      flash[:notice] = t 'views.feedback.success_message'
      redirect_to new_feedback_path
    else
      render :new
    end
  end
end
