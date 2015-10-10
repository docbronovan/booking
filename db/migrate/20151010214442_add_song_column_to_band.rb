class AddSongColumnToBand < ActiveRecord::Migration
  def change
    add_column :bands, :song, :string
  end
end
