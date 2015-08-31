class UsersController < ApplicationController
  def index
    user_id = current_user.id
    @user = User.find(:id)

    if @user.role = 'BAND'
      @band = Band.where("user_id = '%#{params[:user_id]}%'")
    elsif @user.role = 'VENUE'
      @venue = Venue.where("user_id = '%#{params[:user_id]}%'")
    else
      @message = "Set up your profile!"
    end
  end

  def show
    @user = User.find(params[:id])

    if @user.role = 'BAND'
      @band = Band.where("user_id = '%#{params[:user_id]}%'")
    elsif @user.role = 'VENUE'
      @venue = Venue.where("user_id = '%#{params[:user_id]}%'")
    else
      @message = "Set up your profile!"
    end
    
  end

end
