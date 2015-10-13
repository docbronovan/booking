class Slot < ActiveRecord::Base
  belongs_to :event
  has_many :slot_applications, dependent: :destroy
  has_one :band
  
  validates_uniqueness_of :time, :scope => :event_id

  after_update :update_slot_application, on: :update 

  private

  def update_slot_application
    # @slot = self
    # @slot_app = SlotApplication.all 
    # #make sure slot apps status gets updated
    #   @slot_app.each do |slot_app|
    #     if @slot.confirmed == false
    #       if slot_app.slot_id == @slot 
    #         slot_app.approved = false
    #       end
    #     elsif @slot.confirmed == true
    #       if slot_app.slot_id == @slot 
    #         slot_app.approved = true
    #       end
    #     end
    #   end
    
  end

end
