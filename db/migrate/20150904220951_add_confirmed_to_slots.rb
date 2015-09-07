class AddConfirmedToSlots < ActiveRecord::Migration
  def change
    add_column    :slots, :confirmed, :boolean
  end
end
