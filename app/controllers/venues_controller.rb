class VenuesController < ApplicationController
  def index
  end

  def about
    @venue = Venue.find(params[:id])
    @user = @venue.user_id
    @return_to ||= request.referer
  end

  def show
    @venue = Venue.find(params[:id])
    @events = Event.all
    @no_slots = Event.joins("LEFT JOIN slots ON events.id = slots.event_id where slots.event_id is null").order(:date).uniq #finds events that do not have any slots added yet.
    @open_event = event_open #get list of events with open slots
    @closed_event = event_closed(@open_event, @no_slots) # get list of events with zero open slots
  end
  
  def edit
    @venue = Venue.find(params[:id])
    @email = @venue.email
  end

  def update
    @venue = Venue.find(params[:id])
    @email = @venue.email
    if @venue.update_attributes(venue_params)
      redirect_to @venue
      flash[:notice] = "Venue info was updated."
    else
      render :edit
    end
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = current_user.venues.new(venue_params)  
    if @venue.save
      flash[:notice] = "Venue was saved."
      redirect_to @venue
    else
      render :new 
    end
  end

  def venue_params
    params.require(:venue).permit(:user,:name,:city,:address,:state,:zip,:neighborhood,:phone,:description,:website,:email,:email_confirmation,:photo)
  end

  # called by show method above
  # checks for unconfirmed slots
  def event_open
    @open_event = []
    
    @slots = Slot.all
    @slots.each do |slot|
      if slot.confirmed == false 
        @open_event << slot.event_id
      end
    end
    @open_event = @open_event.uniq #return array of open events
  end
  
  # called by show method above
  # Any events that are neither open nor have zero slots have open slots
  def event_closed(open, no_slots)
    @other_event = []
    no_slots.each do |noslot|
      @other_event << noslot.id 
    end
    @other_event = @other_event.uniq
    @not_closed = []
    @not_closed  = @not_closed + @other_event
    @not_closed  = @not_closed + open

    @closed_event = Event.where("id NOT IN (?)", @not_closed)
  end

end
