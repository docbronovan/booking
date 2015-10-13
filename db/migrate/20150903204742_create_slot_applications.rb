class CreateSlotApplications < ActiveRecord::Migration
  def change
    create_table :slot_applications do |t|
      t.references :band, index: true, foreign_key: true
      t.references :slot, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
