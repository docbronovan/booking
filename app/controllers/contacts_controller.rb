class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @email = current_user.email
  end

  def create
    @contact = Contact.new(contact_params)
    @role = current_user.role
    if @contact.save
      UserMailer.contact_email(@contact.name, @contact.email, @contact.message, @role).deliver_later
      redirect_to current_user
      #flash[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      #redirect_to @contact
      render :new
    end
  end

  def contact_params
    params.require(:contact).permit(:name,:email,:message)
  end

end