class VenuesController < ApplicationController
  def index
  end

  def show
    @venue = Venue.find(params[:id])
    @events = Event.all
  end
end
