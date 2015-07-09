# model for product's types AND models
class Gear < ActiveRecord::Base
  has_many :products

  validates :name, presence: true

  scope :base, -> { where(parent_id: nil) }
  scope :notbase, -> { where.not(parent_id: nil) }

  def parent
    Gear.base.find_by(id: parent_id)
  end

  def children
    Gear.where(parent_id: id)
  end
end
