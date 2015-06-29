# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Categories
Category.create(name: 'romantyczna')
Category.create(name: 'na niegrzecznego')
Category.create(name: 'milo i sympatycznie')
Category.create(name: 'silownia to moje zycie')
Category.create(name: 'full pro')

#Gears/type
Gear.create(name: 'tablet')
Gear.create(name: 'laptop')
Gear.create(name: 'telefon')

#Gears/model
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
