puts 'Cleaning DB - please wait...'

puts 'Destroying user lists...'
UserList.destroy_all

puts 'Destroying items...'
Item.destroy_all

puts 'Destroying lists...'
List.destroy_all

puts 'Destroying users...'
User.destroy_all

puts '👹 Finished destroying DB'

puts '👶 Playing God and creating people...'

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

puts "🕊 Created #{user_first_name} #{user_last_name} and given to the Stork to deploy to Earth"

# SEED LISTS

  list_one = List.create!(
    name: 'DIY 🔨',
    due_date: Faker::Date.forward(days: 365)
  )
  puts "🍺 Created #{list_one.name}. Let's get organised!"

  list_two = List.create!(
    name: 'Groceries 🥦',
    due_date: Faker::Date.forward(days: 365)
  )
  puts "🍺 Created #{list_two.name}. Let's get organised!"

  list_three = List.create!(
    name: 'BBQ 🍔🌭🥗',
    due_date: Faker::Date.forward(days: 365)
  )
  puts "🍺 Created #{list_three.name}. Let's get organised!"

  list_four = List.create!(
    name: 'BBQ 🍔🌭🥗',
    due_date: Faker::Date.forward(days: 365)
  )
  puts "🍺 Created #{list_four.name}. Let's get organised!"

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

# SEED ITEMS

items_one = [
  'Screws',
  'Mallet',
  'Spray paint',
  'Sandpaper',
]

items_two = [
  'Limes',
  'Tofu',
  'Milk',
  'Gyozas',
  'Spring onions',
]

items_three = [
  'Bugers',
  'Kebabs',
  'Stuff for a salad',
  'Prawns',
  'Bread rolls',
  'Deer Antler'
]

items_four = [
  'Bugers',
  'Kebabs',
  'Stuff for a salad',
  'Prawns',
  'Bread rolls',
  'Deer Antler'
]

item_categories = [
  'book_store',
  'clothing_store',
  'convenience_store',
  'shopping_mall',
  'liquor_store',
  'drugstore',
  'furniture_store',
  'post_office',
  'pet_store',
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
    list_id: list_one.id,
    user_id: UserList.find_by(list_id:list_one.id).user.id
  )
  puts "🚀 Created #{item} in #{item_category}"
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
    list_id: list_two.id,
    user_id: UserList.find_by(list_id:list_two.id).user.id
  )
  puts "👽 Created #{item} in #{item_category}"
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
    list_id: list_three.id,
    user_id: UserList.find_by(list_id:list_three.id).user.id
  )
  puts "🪐 Created #{item} in #{item_category}"
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
    list_id: list_four.id,
    user_id: UserList.find_by(list_id:list_four.id).user.id
  )
  puts "🍆 Created #{item} in #{item_category}"
end
