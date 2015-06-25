class Gear < ActiveRecord::Base 
  has_many :products

  validates :name, presence: true

  scope :base, -> { where(parent_id: nil) }

  def parent
    Gear.base.find_by(id: self.parent_id)
  end

  def children
    Gear.where(parent_id: self.id)
  end
end
