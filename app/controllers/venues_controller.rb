class VenuesController < ApplicationController
  def index
  end

  def about
    @venue = Venue.find(params[:id])
    @user = @venue.user_id
  end

  def show
    @venue = Venue.find(params[:id])
    @events = Event.all
  end
end
