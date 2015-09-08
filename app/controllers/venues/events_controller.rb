class Venues::EventsController < ApplicationController

  def index 
    @venue = Venue.find(params[:venue_id])
    @slots = Slot.all
    @events = Event.where("venue_id = ?", @venue.id)
    #@listings = Event.joins(:slots).where(slots: { confirmed: false }).order(:date).uniq    
  end

  def show
    @event = Event.find(params[:id])
    @venue = Venue.find(@event.venue_id)
    @slots = Slot.where("event_id = ?", @event.id).order(:time) #all of the slots assocated with event
    @slot_apps = SlotApplication.all # ALL slot applications
    @bands = Band.all # ALL bands

  end

  def new
    @venue = Venue.find(params[:venue_id])
    @event = Event.new
 
  end

  def create
    @venue = Venue.find(params[:venue_id])
    
    @event = current_user.events.build(event_params)
    authorize @event
    @event.venue = @venue
    if @event.save
      @event.create_vote
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

  private

  def event_params
    params.require(:event).permit(:title, :date ,:twentyOne, :cover, :stage, :equipment, :description, :other, :disclaimer)
  end
end
