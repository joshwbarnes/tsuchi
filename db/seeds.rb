puts 'Cleaning DB - please wait...'

puts 'Destroying users...'
User.destroy_all
puts 'Destroying lists...'
List.destroy_all
puts 'Destroying items...'
Item.destroy_all
puts 'Destroying user lists...'
UserList.destroy_all

puts 'Finished destroying DB'

puts 'Playing God and creating people... 👶'

# SEED USERS

5.times do
  user_name = Faker::Name.name 
  user_address = Faker::Address.street_address
  user_email = Faker::Internet.email
  user_mobile_number = Faker::PhoneNumber.cell_phone
  
  User.create!(
    name: user_name, 
    address: user_address, 
    email: user_email, 
    mobile_number: user_mobile_number
  )

  puts "Created #{user_name} and given to the Stork to deploy to Earth 🕊"
end

# SEED LISTS

lists = [
  'Christmas',
  'Groceries',
  'Birthday',
  'DIY',
  'Easter'
]

lists.each do |list|
  list_name = list
  due_date = Faker::Date.forward(days: 365)

  List.create!(
    name: list_name, 
    due_date: due_date
  )

  puts "Created #{list_name}. Let's get organised!"
end

# SEED ITEMS

items = [
  Faker::House.furniture,
  Faker::Food.ingredient,
  Faker::Cannabis.buzzword,
  Faker::Appliance.equipment
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

20.times do
  name = items[rand(0..item.length - 1)]
  item_category = item_categories[rand(0..item_category.length - 1)]
  quantity = rand(1..10)
  
  Item.create!(
    name: name,
    item_category: item_category,
    quantity: quantity,
    completed: false,
    notification: true
  )

  puts "Created #{name} 🚀"
end