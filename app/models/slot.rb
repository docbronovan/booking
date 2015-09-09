class Slot < ActiveRecord::Base
  belongs_to :event
  has_many :slot_applications, dependent: :destroy



end
