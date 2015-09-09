class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :bands, dependent: :destroy
  has_many :venues, dependent: :destroy

  def band?
    role == 'BAND'
  end
 
  def venue?
    role == 'VENUE'
  end

  def admin?
    role == 'ADMIN'
  end
end
