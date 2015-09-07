class ChangeBandPhone < ActiveRecord::Migration
  def change
    change_table :bands do |t|
      t.remove :phone
      t.string :phone
    end
  end
end
