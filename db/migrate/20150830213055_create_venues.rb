class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :neighborhood
      t.string :phone
      t.string :email, null: false
      t.string :website
      t.string :photo
      t.text :description
      
      t.timestamps null: false
    end
  end
end
