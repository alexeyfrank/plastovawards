class FeedbackMailer < ActionMailer::Base
  default from: "info@plastovawards.com"
  
  def info_email(feed)
    @feed = feed
    mail to: Settings.email, subject: "Got a new question from PlastovAwards.com!"
  end
end
