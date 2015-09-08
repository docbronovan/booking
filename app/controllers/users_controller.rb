class UsersController < ApplicationController
  def index
 
  end

  def show
    @user = current_user
    if @user.role == 'BAND'
      @bands = @user.bands
    end 
    if @user.role == 'VENUE'
      @venues = @user.venues
    end 
  end

end
