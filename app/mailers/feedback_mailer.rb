class FeedbackMailer < ActionMailer::Base
  default from: "info@plastovawards.com"
  
  def info_email(feed)
    @feed = feed
    mail to: feed.email, subject: "Thank you for question!"
  end
end
