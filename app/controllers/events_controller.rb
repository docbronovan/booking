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
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def open_slot(events, *args) #should take array
    open_events = nil
    listing = []
    @slots = Slot.all
    events.each do |event|
      @slots.each do |slot| 
        if slot.event_id == event
          if slot.approved == false
            open_events = slot.event_id
            break
          end
        end
      end
      
      unless open_events.nil? 
        listing.push(slot.event_id)
      end
    
    end

    return listing #should return array
  end

end
