class Gear < ActiveRecord::Base 
  has_one :gear
  belongs_to :product

  validates :name, presence: true

  scope :base, -> { where(parrent_id = nil) }
  scope :specific, lambda {|name| where(name = base) }
end