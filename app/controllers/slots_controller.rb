class SlotsController < ApplicationController
  def create
  end

  def show
    @slot = Slot.find(params[:id])
    @band = @slot.band
    @venue = @slot.venue
  end

  def update
  end

  def destroy
  end
end
