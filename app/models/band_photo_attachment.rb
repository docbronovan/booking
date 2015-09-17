class BandPhotoAttachment < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :band
end
