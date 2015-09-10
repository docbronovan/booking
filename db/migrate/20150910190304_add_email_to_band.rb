class AddEmailToBand < ActiveRecord::Migration
  def change
    add_column :bands, :email, :string,null: false, default: ""
  end
end
