class Slot < ActiveRecord::Base
  belongs_to :event
  has_many :slot_applications, dependent: :destroy

 validates_uniqueness_of :time, :scope => :event_id

end
