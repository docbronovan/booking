class Venue < ActiveRecord::Base
  
  belongs_to :user
  has_many :events, dependent: :destroy
  
  mount_uploader :photo, PhotoUploader

  validates_presence_of :user,:name,:city,:address,:state,:zip,:neighborhood,:phone,:description,:email,:email_confirmation
  validates :name, uniqueness: { case_sensitive: false}
  validates :city, length: { minimum: 2 }
  validates :email, confirmation: true
  validates :phone, length: { in: 10..20 }
  validates :zip, numericality: { only_integer: true }
end
