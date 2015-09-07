class SlotApplication < ActiveRecord::Base
  belongs_to :slot
  belongs_to :band
end
