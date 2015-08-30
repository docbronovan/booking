class Slot < ActiveRecord::Base
  belongs_to :event
  belongs_to :band
end
