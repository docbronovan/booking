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
    @slot = Slot.build(params.require(:slot))
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

  end

  def update
  end

  def destroy
  end
end
