class Web::FeedbackController < Web::ApplicationController
  def new
    @feed = Feedback.new
    header_img 'ask-question'
  end

  def create
    header_img 'ask-question'
    @feed = Feedback.new params[:feedback]
    if @feed.save 
      redirect_to new_feedback_path
    else
      flash[:notice] = "Got some errors!"
      render :new
    end
  end
end
