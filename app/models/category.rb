class Category < ActiveRecord::Base
  has_many :products
  validates :name, presence: {message: 'Nie podano nazwy kategorii'}

end
