class UsersController < ApplicationController
  def index
 
  end

  def show
    @user = current_user
    if @user.role == 'BAND'
      @bands = @user.bands
    end 
  end

end
