class RemoveBandFromSlots < ActiveRecord::Migration
  def change
    remove_column :slots, :band_id
    remove_column :slots, :approved
  end
end
