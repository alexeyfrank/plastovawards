class FeedbackObserver < ActiveRecord::Observer
  def after_create(model)
    begin
      FeedbackMailer.info_email(model).deliver
    rescue
    end
  end
end
