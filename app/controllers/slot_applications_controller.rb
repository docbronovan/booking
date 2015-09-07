class SlotApplicationsController < ApplicationController
  def index
  end

  def new
    @slot_app = SlotApplication.new
    @bands = current_user.bands
  end

  def create
    @slot_app = SlotApplication.new(slot_app_params)  
    if @slot_app.save
      flash[:notice] = "Applications was saved."
      redirect_to current_user
    else
      flash[:error] = "There was an error with the application. Please try again."
      render :new #added by me so I dont get template error
    end
  end

  def slot_app_params
    params.require(:slot_application).permit(:band_id, :slot_id, :approved)
  end

end