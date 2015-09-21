class BandsController < ApplicationController
  def index
  end

  def about
    @band = Band.find(params[:id])
    @user = @band.user_id
    @return_to ||= request.referer
  end

  def edit
    @band = Band.find(params[:id])
  end

  def new
    @band = Band.new
  end

  def show
    @band = Band.find(params[:id])
    @slot_apps = SlotApplication.all
    #@slot_apps = SlotApplication.joins(:band).where(bands: { id: @band }).uniq
    @slots = Slot.all
    @events = Event.all
    @venue = Venue.all
  end


  def create
    @band = current_user.bands.new(band_params)  
    if @band.save
      flash[:notice] = "Band was saved."
      redirect_to @band
    else
      flash[:error] = "There was an error saving the band. Please try again."
      render :new #added by me so I dont get template error
    end
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(band_params)
      redirect_to @band
      flash[:notice] = "Band info was updated."
    else
      flash[:error] = "Error saving band. Please try again."
      render :edit
    end
  end

  def band_params
    params.require(:band).permit(:user,:name,:city,:members,:instruments,:description,:genre,:requirements,:soundcloud,:facebook,:website,:phone,:email,:photo)
  end
  


end
