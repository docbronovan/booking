class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :city
      t.integer :members
      t.string :instrumets
      t.text :description
      t.string :genre
      t.string :requirements
      t.string :text
      t.string :soundcloud
      t.string :facebook
      t.string :website

      t.timestamps null: false
    end
  end
end
