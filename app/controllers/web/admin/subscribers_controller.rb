class Web::Admin::SubscribersController < Web::Admin::ApplicationController
  def index
    @subscribers = Subscriber.all #.page(params[:page]).per(configus.admin_entities_per_page)
  end

  def edit
    @subscriber = Subscriber.find params[:id]
  end

  def update
    @subscriber = Subscriber.find params[:id]
    if @subscriber.update_attributes params[:subscriber]
      flash[:notice] = "Subscriber successfully updated"
    else
      flash[:error] = "Subscriber has some errors"
    end
    render :edit
  end

  def destroy
    @subscriber = Subscriber.find params[:id]
    @subscriber.delete
    redirect_to admin_subscribers_path
  end
end
