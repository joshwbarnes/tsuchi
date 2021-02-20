# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all
puts 'Creating items...'
Item.create
the_universe = Item.new(name: "The Universe By Lonely Planet", item_category: "Books")
the_universe.save!

garmin_watch = Item.new(name: "Garmin Running Watch", item_category: "Sporting goods")
garmin_watch.save!

hammock = Item.new(name: "Hammock", item_category: "Camping")
hammock.save!

kaffir_lime_tree = Item.new(name: "Kaffir Lime Tree", item_category: "Gardening")
kaffir_lime_tree.save!

cashews = Item.new(name: "Cashew Nuts", item_category: "Supermarket")
cashews.save!
puts 'Finished!'
