class Gear < ActiveRecord::Base 
  has_one :gear
  has_many :products

  validates :name, presence: true

  scope :base, -> { where(parrent_id = nil) }
  scope :specific, lambda {|name| where(name = base) }
end