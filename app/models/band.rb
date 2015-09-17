class Band < ActiveRecord::Base
  belongs_to :user
  has_many :slot_applications, dependent: :destroy
  has_many :band_photo_attachments
  accepts_nested_attributes_for :band_photo_attachments
  #scope :visible_to, -> (current_user) { where('user_id = ?', current_user.id) }

end
