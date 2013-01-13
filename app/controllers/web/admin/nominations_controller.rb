class Web::Admin::NominationsController < Web::Admin::ApplicationController
  def index
    @nominations = Nomination.all
  end

  def new
    @nomination = Nomination.new
  end

  def create
    @nomination = Nomination.new params[:nomination]
    if @nomination.save
      flash[:notice] = "Successfully created!"
      redirect_to admin_nominations_path
    else
      flash[:error] = "Got some errors!"
      render :new
    end
  end

  def edit
    @nomination = Nomination.find params[:id]
  end

  def update
    @nomination = Nomination.find params[:id]
    if @nomination.update_attributes params[:nomination]
      flash[:notice] = "Successfully updated!"
      redirect_to admin_nominations_path
    else
      flash[:error] = "Got some errors!"
      render :new
    end
  end

  def destroy
    @nomination = Nomination.find params[:id]
    @nomination.delete
    flash[:notice] = "Successfully destroyed!"
    redirect_to admin_nominations_path
  end
end
