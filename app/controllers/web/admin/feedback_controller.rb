class Web::Admin::FeedbackController < Web::Admin::ApplicationController
  def index
    @feeds = Feedback.all
  end

  def show
    @feed = Feedback.find params[:id]
  end

  def respond
  end

  def destroy
    @feed = Feedback.find params[:id]
    @feed.delete
    flash[:notice] = "Feed successfully deleted"
    redirect_to admin_feedback_index_path
  end
end
