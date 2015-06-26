class Category < ActiveRecord::Base
  has_many :products

  def self.addcore
    Category.create(name: 'romantyczna')
    Category.create(name: 'na niegrzecznego')
    Category.create(name: 'milo i sympatycznie')
    Category.create(name: 'silownia to moje zycie')
    Category.create(name: 'full pro')
  end
end
