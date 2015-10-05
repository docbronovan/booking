class Band < ActiveRecord::Base
  belongs_to :user
  has_many :slot_applications, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  #scope :visible_to, -> (current_user) { where('user_id = ?', current_user.id) }
  validates_presence_of :name,:city,:members,:instruments,:genre,:soundcloud,:facebook,:website,:description,:phone,:email,:email_confirmation
  validates :name, uniqueness: { case_sensitive: false}
  validates :city, length: { minimum: 2 }
  validates :email, confirmation: true
  validates :phone, length: { in: 10..20 }
end
