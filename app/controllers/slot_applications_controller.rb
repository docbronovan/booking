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
    @date = @slot.time.strftime("%B %d, %Y")
    @time = @slot.time.strftime("%l:%M %P")
    @slot_app = @slot.slot_applications.new(slot_app_params)
    @venue  = @slot.event.venue
    @band = Band.all
    if @slot_app.save
      UserMailer.request_email(@venue.user, @date, @time).deliver_later
      flash[:notice] = "Application was saved. You should hear from the venue soon."
      redirect_to current_user
    else
      flash[:error] = "There was an error with the application. Please try again."
      render :new 
    end
  end

  def update
    @slot = Slot.find(params[:slot_id])
    if @slot.update_attributes(:confirmed)
      flash[:notice] = "Band confirmed"
      redirect_to slot_applications_path
    else
      flash[:error] = "There was an error confirming the band. Please try again."
      render :edit
    end
  end

  def slot_app_params
    params.require(:slot_application).permit(:band_id, :slot_id, :approved)
  end

end