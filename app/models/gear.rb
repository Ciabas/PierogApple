class Gear < ActiveRecord::Base 
  has_many :products

  validates :name, presence: true

  scope :base, -> { where(parent_id: nil) }
  scope :notbase, -> { where.not(parent_id: nil) }

  def parent
    Gear.base.find_by(id: self.parent_id)
  end

  def children
    Gear.where(parent_id: self.id)
  end

  def self.addcore
    Gear.create(name: 'tablet')
    Gear.create(name: 'laptop')
    Gear.create(name: 'telefon')

    Gear.create(name: 'mini 2', parent_id: 1)
    Gear.create(name: 'mini 3', parent_id: 1)
    Gear.create(name: 'air', parent_id: 1)

    Gear.create(name: '11 cali', parent_id: 2)
    Gear.create(name: '10 cali', parent_id: 2)
    Gear.create(name: '2 cale', parent_id: 2)

    Gear.create(name: '5s', parent_id: 3)
    Gear.create(name: '4s', parent_id: 3)
    Gear.create(name: '6', parent_id: 3)
    Gear.create(name: '6plus', parent_id: 3)    
  end
end
