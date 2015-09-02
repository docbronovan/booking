class EventsController < ApplicationController
  def index
    @events = Event.all
    @slots = Slot.all
  end

  def show
    @event = Event.find(params[:id])
    @venue = @event.venue
    @slots = Slot.all
    @bands = Band.all

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
end
