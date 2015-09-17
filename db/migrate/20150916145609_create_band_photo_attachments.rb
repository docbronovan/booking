class CreateBandPhotoAttachments < ActiveRecord::Migration
  def change
    create_table :band_photo_attachments do |t|
      t.integer :band_id
      t.string :photo

      t.timestamps null: false
    end
  end
end
