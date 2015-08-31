class ChangeMemberToRole < ActiveRecord::Migration
  def change
    rename_column :users, :member_type, :role
  end
end
