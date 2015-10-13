class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :message
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "New locl shows message",
      :to => "brockdonovan@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
