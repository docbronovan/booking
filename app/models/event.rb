class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :slots, dependent: :destroy

  validates_presence_of :title,:date, :stage, :equipment, :description, :other, :disclaimer
  
end
