class EventsController < ApplicationController
  def index
    @events = Event.all
    #@events = Event.order(params[:sort])
    @slots = Slot.all
    @listings = Event.joins(:slots).where(slots: { confirmed: false }).order(:date).uniq
  end

  def show
    @event = Event.find(params[:id]) #single event
    @venue = @event.venue #single venue
    @slots = Slot.where("event_id = ?", @event.id) #all of the slots assocated with event
    @slot_apps = SlotApplication.all # ALL slot applications
    @bands = Band.all # ALL bands

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.build(event_params)
    if @event.save
      flash[:notice] = "Event was saved."
      redirect_to [@venue, @event]
    else
      flash[:error] = "There was an error saving the event. Please try again."
      render :new #added by me so I dont get template error
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

  def event_params
    params.require(:event).permit(:title, :date ,:twentyOne, :cover, :stage, :equipment, :description, :other, :disclaimer)
  end

  # open_slot determines if there is a slot that does not have a confirmed band
  # If so, the event is added to the listings array which it itterated over in
  # app/views/events/index.html.erb
  def open_slot(events, *args) #should take array
    open_events = nil
    listing = []
    @slots = Slot.all
    events.each do |event|
      @slots.each do |slot| 
        if slot.event_id == event
          if slot.confirmed == false
            open_events = slot.event_id
            break
          end
        end
      end
      
      unless open_events.nil? 
        listing.push(slot.event_id)
      end
    
    end

    return listing #returns array of events with open slots
  end

end
