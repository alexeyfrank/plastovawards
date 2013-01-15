class Web::FeedbackController < Web::ApplicationController
  def new
    @feed = Feedback.new
    header_img 'ask-question'
  end

  def create
    header_img 'ask-question'
    @feed = Feedback.new params[:feedback]
    if @feed.save 
      flash[:notice] = "Thank for your question!"
    else
      flash[:notice] = "Got some errors!"
    end
    render :new
  end
end
