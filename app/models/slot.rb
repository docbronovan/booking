class Slot < ActiveRecord::Base
  belongs_to :event
  has_many :slot_applications, dependent: :destroy
  belongs_to :band
  
  validates_uniqueness_of :time, :scope => :event_id
  #validates_uniqueness_of :band_id, :scope => :event_id, :allow_blank => true, :allow_nil=> true

  private


end
