class AddEmailToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :email, :string, null: false, default: ""
  end
end
