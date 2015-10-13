class RemoveNicknameFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :nickname, :varchar
  end
end
