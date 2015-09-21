class Venue < ActiveRecord::Base
  
  belongs_to :user
  has_many :events, dependent: :destroy
  mount_uploader :photo, PhotoUploader

end
