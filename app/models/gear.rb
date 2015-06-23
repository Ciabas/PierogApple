class Gear < ActiveRecord::Base 
  has_many :products

  validates :name, presence: true

  scope :base, -> { where(parrent_id: nil) }
  scope :specific, lambda {|whiczGear| where(parrent_id: whiczGear.id ) }

  def parrent
    gear_parrents = Gear.base
    my_parrent = gear_parrents.where(id: self.parrent_id)
    return my_parrent
  end
end