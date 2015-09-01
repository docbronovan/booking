class RemoveBandFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :band_id
  end
end
