class Venues::EventsController < ApplicationController

  def new
    @event = Event.new
    @venue = Venue.find(params[:venue_id])
    
  end

  def index 
    @venue = Venue.find(params[:venue_id])
    @slots = Slot.all
    @events = Event.where("venue_id = ?", @venue.id)
  end

  def show
    @event = Event.find(params[:id])
    @venue = Venue.find(@event.venue_id)
    @slots = Slot.where("event_id = ?", @event.id).order(:time) #all of the slots assocated with event
    @slot_apps = SlotApplication.all # ALL slot applications
    @bands = Band.all # ALL bands
    @waiting = venue_event_slot_applications(@slots, @slot_apps)
  end

  def create
    @venue = Venue.find(params[:venue_id])
    
    @event = Event.new(event_params)
    @event.venue = @venue
    if @event.save
      flash[:notice] = "Event was saved."
      redirect_to [@venue, @event]
    else
      flash[:error] = "There was an error saving the event. Please try again."
      render :new #added by me so I dont get template error
    end
  end

  def edit
    @venue = Venue.find(params[:venue_id])
    @event = Event.find(params[:id])
    #authorize @event
  end

  def update
    @venue = Venue.find(params[:venue_id])
    @event = Event.find(params[:id])
    #authorize @event
    if @event.update_attributes(event_params)
      flash[:notice] = "Event was updated."
      redirect_to [@venue,@event]
    else
      flash[:error] = "There was an error saving the event. Please try again."
      render :edit
    end
  end

  def destroy
    @venue = Venue.find(params[:venue_id])
    @event = Event.find(params[:id])
    #authorize @event

    if @event.destroy
      flash[:notice] = "\"#{@event.title}\" was deleted sucessfully."
      redirect_to @venue
    else
      flash[:error] = "There was an error deleting the event."
      render :show
    end
  end

  # determines if there are any unconfirmed applications for any time slot in a specific event
  # this is referenced by slot to display notification that bands are waiting to be confirmed
  def venue_event_slot_applications(slots, slot_apps)

    @slots = slots
    @slot_apps = slot_apps
    @waiting = []
    @slots.each do |slot|
      if slot.confirmed == false
        @slot_apps.each do |slot_app|
          if slot_app.slot_id == slot.id
            @waiting << slot_app.slot_id
          end
        end
      end
    end
    @waiting = @waiting.uniq
  end

  private

  def event_params
    params.require(:event).permit(:title,:date ,:twentyOne, :cover, :stage, :equipment, :description, :other, :disclaimer)
  end

end
