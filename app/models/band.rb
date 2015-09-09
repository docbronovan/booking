class Band < ActiveRecord::Base
  belongs_to :user
  has_many :slot_applications, dependent: :destroy

  #scope :visible_to, -> (current_user) { where('user_id = ?', current_user.id) }

end
