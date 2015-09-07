class DefaultToFalse < ActiveRecord::Migration
  def change
    change_column :slot_applications, :approved, :boolean, :default => false
    change_column :slots, :confirmed, :boolean, :default => false
  end
end
