class FixBandsTable < ActiveRecord::Migration
  def change
    rename_column :bands, :instrumets, :instruments
    remove_column :bands, :text
    add_column    :bands, :phone, :integer
  end
end
