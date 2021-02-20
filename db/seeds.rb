puts 'Cleaning DB - please wait...'

puts 'Destroying users...'
User.destroy_all
puts 'Destroying lists...'
List.destroy_all
puts 'Destroying items...'
Item.destroy_all
puts 'Destroying user lists...'
UserList.destroy_all

puts 'Finished destroying DB 👹'

puts 'Playing God and creating people... 👶'

# SEED USERS
user_first_name = Faker::Name.first_name 
user_last_name = Faker::Name.last_name
user_address = Faker::Address.street_address
user_mobile_number = Faker::PhoneNumber.cell_phone

user_one = User.create!(
  first_name: user_first_name, 
  last_name: user_last_name,
  address: user_address, 
  email: 'user@user.com', 
  mobile_number: user_mobile_number,
  password: '123456'
)

user_two = User.create!(
  first_name: user_first_name, 
  last_name: user_last_name,
  address: user_address, 
  email: 'user2@user.com', 
  mobile_number: user_mobile_number,
  password: '123456'
)

puts "Created #{user_first_name} #{user_last_name} and given to the Stork to deploy to Earth 🕊"

# SEED LISTS

  list_one = List.create!(
    name: 'Christmas',
    due_date: Faker::Date.forward(days: 365)
  )
  puts "Created #{list_one}. Let's get organised! 🍺"

  list_two = List.create!(
    name: 'Groceries',
    due_date: Faker::Date.forward(days: 365)
  )
  puts "Created #{list_two}. Let's get organised! 🍺"

  list_three = List.create!(
    name: 'Birthday',
    due_date: Faker::Date.forward(days: 365)
  )
  puts "Created #{list_three}. Let's get organised! 🍺"

  list_four = List.create!(
    name: 'DIY',
    due_date: Faker::Date.forward(days: 365)
  )
  puts "Created #{list_four}. Let's get organised! 🍺"

  list_five = List.create!(
    name: 'Easter',
    due_date: Faker::Date.forward(days: 365)
  )
  puts "Created #{list_five}. Let's get organised! 🍺"

# SEED ITEMS

items_one = [
  Faker::House.furniture,
  Faker::Food.ingredient,
  Faker::Cannabis.buzzword,
  Faker::Appliance.equipment
]

items_two = [
  'Hammock',
  'Tent',
  'Esky',
  'Fishing Rod',
  'Sleeping Bag'
]

items_three = [
  'Kaffir Lime Tree',
  'Gas bottle',
  'Paint brush',
  'Ladder',
  'BBQ'
]

items_four = [
  'The Universe by Lonely Planet',
  'Taylor Swift Album',
  'Water Colors',
  'How to train your border collie - book',
  'Bongos'
]

items_five = [
  'Vacuum',
  'Water Bottle',
  'Piglet',
  'Plant',
  'Tea'
]

item_categories = [
  'book_store',
  'clothing_store',
  'convenience_store',
  'dentist',
  'plumber',
  'shopping_mall',
  'liquor_store',
  'museum'
]

###### List group ONE

items_one.each do |item| 
  item_category = item_categories[rand(0..item_categories.length - 1)]
  quantity = rand(1..10)

  Item.create!(
    name: item,
    item_category: item_category,
    quantity: quantity,
    completed: false,
    notification: true,
    list_id: list_one.id
  )
  puts "Created #{item} in #{item_category} 🚀"
end

###### List group TWO

items_two.each do |item| 
  item_category = item_categories[rand(0..item_categories.length - 1)]
  quantity = rand(1..10)

  Item.create!(
    name: item,
    item_category: item_category,
    quantity: quantity,
    completed: false,
    notification: true,
    list_id: list_two.id
  )
  puts "Created #{item} in #{item_category} 🚀"
end

###### List group THREE

items_three.each do |item| 
  item_category = item_categories[rand(0..item_categories.length - 1)]
  quantity = rand(1..10)

  Item.create!(
    name: item,
    item_category: item_category,
    quantity: quantity,
    completed: false,
    notification: true,
    list_id: list_three.id
  )
  puts "Created #{item} in #{item_category} 🚀"
end

###### List group FOUR

items_four.each do |item| 
  item_category = item_categories[rand(0..item_categories.length - 1)]
  quantity = rand(1..10)

  Item.create!(
    name: item,
    item_category: item_category,
    quantity: quantity,
    completed: false,
    notification: true,
    list_id: list_four.id
  )
  puts "Created #{item} in #{item_category} 🚀"
end

###### List group FIVE

items_five.each do |item| 
  item_category = item_categories[rand(0..item_categories.length - 1)]
  quantity = rand(1..10)

  Item.create!(
    name: item,
    item_category: item_category,
    quantity: quantity,
    completed: false,
    notification: true,
    list_id: list_five.id
  )
  puts "Created #{item} in #{item_category} 🚀"
end

# SEED USER_LISTS

UserList.create!(
  user_id: user_one.id,
  list_id: list_one.id
)

UserList.create!(
  user_id: user_one.id,
  list_id: list_two.id
)

UserList.create!(
  user_id: user_one.id,
  list_id: list_three.id
)

UserList.create!(
  user_id: user_two.id,
  list_id: list_four.id
)

UserList.create!(
  user_id: user_two.id,
  list_id: list_five.id
)