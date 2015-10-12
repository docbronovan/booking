
class BandsController < ApplicationController
  # require 'soundcloud'

  def index
  end

  def about
    require 'uri'
    @band = Band.find(params[:id])
    @user = @band.user_id
    @return_to ||= request.referer

    @scloud = URI(@band.soundcloud).path.split(/\//i)[1]
    
    unless @song.nil?
      @song = @band.song.gsub(' ','-')
      @source = "http://player.soundcloud.com/player.swf?url=http%3A%2F%2Fsoundcloud.com%2F"+@scloud+"%2F"+@song+"&color=ff7700&amp;sharing=false&amp;show_playcount=false"
    end
  end

  def edit
    @band = Band.find(params[:id])
    @email = @band.email
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

    # @client = scloud
   

  end


  def create
    @band = current_user.bands.new(band_params)  
    if @band.save
      flash[:notice] = "Band was saved."
      redirect_to @band
    else
      render :new 
    end
  end

  def update
    @band = Band.find(params[:id])
    @email = @band.email
    if @band.update_attributes(band_params)
      redirect_to @band
      flash[:notice] = "Band info was updated."
    else
      #flash[:error] = "Error saving band. Please try again."
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])

    if @band.destroy
      flash[:notice] = "\"#{@band.name}\" was deleted sucessfully."
      redirect_to current_user
    else
      flash[:error] = "There was an error deleting the band."
      render :show
    end
  end

  def band_params
    params.require(:band).permit(:user,:name,:city,:members,:instruments,:description,:genre,:requirements,:soundcloud,:facebook,:website,:phone,:email,:email_confirmation,:photo,:song)
  end


  # def scloud
  #   require 'soundcloud'
  #   @client = Soundcloud.new(
  #       :client_id => "1cf5cb7850b34273320400605f7175fd",

  #       :client_secret => "90bc590d968c1f65394e332c089d7ce4",

  #       :username => "Brock Donovan 2",

  #       :password => "fluffy")

  # end  

end
