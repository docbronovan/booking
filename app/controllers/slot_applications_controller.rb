class SlotApplicationsController < ApplicationController
  def index
    @slot = Slot.find(params[:slot_id])
    @slot_applications = SlotApplication.where("slot_id = ?", @slot.id)
    @bands = Band.all
  end

  def new
    @slot = Slot.find(params[:slot_id])
    @slot_app = SlotApplication.new
    @bands = current_user.bands
  end

  def create
    @slot = Slot.find(params[:slot_id])
    @slot_app = @slot.slot_applications.new(slot_app_params)
    @venue  = @slot.event.venue
    if @slot_app.save
      UserMailer.request_email(@venue.user).deliver_later
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