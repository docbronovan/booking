class SlotsController < ApplicationController
  def create
  end

  def show
    @slot = Slot.find(params[:id])
    @band = @slot.band
    @venue = @slot.venue
  end

  def new
    @slot = Slot.new
    @event = Event.find(params[:event_id])
    @bands = current_user.bands
  end

  def create
    @slot = Slot.build(params.require(:slot).permit(:event_id, :time))
    if @slot.save
      #added for through
      #@slot.users << current_user
      flash[:notice] = "Time slot was saved."
      redirect_to @slot
    else
      flash[:error] = "There was an error saving the time slot. Please try again."
      render :new
    end
  end

  def update
    @slot = Slot.find(params[:id])
    if @slot.update_attributes(:confirmed)
      flash[:notice] = "Band confirmed"
      redirect_to slot_applications_path
    else
      flash[:error] = "There was an error confirming the band. Please try again."
      render :edit
    end
  end

  def update
  end

  def destroy
  end
end
