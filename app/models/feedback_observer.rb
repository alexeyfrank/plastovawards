class FeedbackObserver < ActiveRecord::Observer
  def after_create(model)
    FeedbackMailer.info_email(model).deliver
  end
end
