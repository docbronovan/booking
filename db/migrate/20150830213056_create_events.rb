class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :band, index: true, foreign_key: true
      t.references :venue, index: true, foreign_key: true
      t.string :title
      t.date :date
      t.string :twentyOne
      t.integer :cover
      t.string :stage
      t.text :equipment
      t.text :description
      t.text :other
      t.text :disclaimer

      t.timestamps null: false
    end
  end
end
