class AddTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :member_type, :string, null: false, default: ""            
  end
end
