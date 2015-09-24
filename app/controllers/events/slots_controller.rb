class Events::SlotsController < ApplicationController

  def show
    @slot = Slot.find(params[:id])
    @event = Event.find(params[:event_id])
    @bands = @slot.bands #gives collection of bands for this slot
  end

  def new
    @event = Event.find(params[:event_id])
    @slot = Slot.new
    @bands = current_user.bands

  end

  def create
    @event = Event.find(params[:event_id])
    @venue = Venue.find(@event.venue_id)
    @slot = Slot.new(slot_params)
    @slot.event = @event
    if @slot.save
      flash[:notice] = "Slot was saved."
      redirect_to [@venue,@event]
    else
      flash[:error] = "There was an error saving the slot. Please try again."
      render :new #added by me so I dont get template error
    end


  end

  def edit
    @event = Event.find(params[:event_id])
    @slot = Slot.find(params[:id])
    
  end

  def update
    @event = Event.find(params[:event_id])
    @slot = Slot.find(params[:id])
    
    if @slot.update_attributes(slot_params)
      flash[:notice] = "Slot was updated."
      redirect_to @event
    else
      flash[:error] = "There was an error saving the slot. Please try again."
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @slot = Slot.find(params[:id])
    @venue = @event.venue
    if @slot.destroy
      flash[:notice] = "\"#{@slot.title}\" was deleted sucessfully."
      redirect_to @venue
    else
      flash[:error] = "There was an error deleting the slot."
      render :show
    end
  end

  private

  def slot_params
    params.require(:slot).permit(:event_id, :time,:confirmed)
  end
end
