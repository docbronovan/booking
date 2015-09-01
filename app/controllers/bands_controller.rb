class BandsController < ApplicationController
  def index
  end

  def new
    @band = Band.new
  end

  def show
    @band = Band.find(params[:id])
    @slots = @band.slots
    @events = Event.all
  end

  def create
    @band = Band.new(band_params)  
    if @band.save
      flash[:notice] = "Band was saved."
      redirect_to @band
    else
      flash[:error] = "There was an error saving the band. Please try again."
      render :new #added by me so I dont get template error
    end
  end
  def band_params
    params.require(:band).permit(:user,:name,:city,:members,:instruments,:description,:genre,:requirements,:soundcloud,:facebook,:website,:phone)
  end
  
end
