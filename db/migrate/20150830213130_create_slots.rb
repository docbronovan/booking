class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.references :event, index: true, foreign_key: true
      t.references :band, index: true, foreign_key: true
      t.time :time
      t.boolean :approved, :default => true

      t.timestamps null: false
    end
  end
end
