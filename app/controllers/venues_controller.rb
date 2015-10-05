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
    # want to group slots by 
    #@open = Event.joins(:slots).where(slots: { confirmed: false }).order(:date).uniq
    #@closed = Event.joins(:slots).where(slots: { confirmed: true })
    @other = Event.joins("LEFT JOIN slots ON events.id = slots.event_id where slots.event_id is null").order(:date).uniq
    @open_event = event_open
    @closed_event = event_closed(@open_event, @other)
    @num_slots = open_count
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
      #flash[:error] = "Error saving Venue. Please try again."
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
      #flash[:error] = "There was an error saving the venue. Please try again."
      render :new #added by me so I dont get template error
    end
  end

  def venue_params
    params.require(:venue).permit(:user,:name,:city,:address,:state,:zip,:neighborhood,:phone,:description,:website,:email,:email_confirmation,:photo)
  end

  def event_open
    @open_event = []
    
    @slots = Slot.all
    @slots.each do |slot|
      if slot.confirmed == false 
        @open_event << slot.event_id
      end
    end
    @open_event = @open_event.uniq
  end

  def event_closed(open, others)
    @other_event = []
    others.each do |other|
      @other_event << other.id 
    end
    @other_event = @other_event.uniq
    @not_closed = []
    @not_closed  = @not_closed + @other_event
    @not_closed  = @not_closed + open

    @closed_event = Event.where("id NOT IN (?)", @not_closed)
  end

  def open_count 
    @slot_apps = SlotApplication.all
    @events = Event.all
    @venue = Venue.find(params[:id])
    @slots = Slot.all

    num_open_slots = []


  end

  def application_count

  end

end
