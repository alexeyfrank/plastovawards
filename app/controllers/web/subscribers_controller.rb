class Web::SubscribersController < Web::ApplicationController

  layout false
  
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new params[:subscriber]
    if @subscriber.save
      render :text => I18n.t('views.subscribers.success_subscribe')
    else
      render :new
    end
  end
end
