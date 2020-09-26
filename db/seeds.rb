# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Expense.destroy_all
UsersEvent.destroy_all
UsersExpense.destroy_all

# Users
sofia = User.create!(username: "1", email: "1@1.com", password: "1", first_name: "Sofia", last_name: "Wiltshire")
noah = User.create!(username: "2", email: "2@2.com", password: "2", first_name: "Noah", last_name: "Wiltshire")
bilen = User.create!(username: "3", email: "3@4.com", password: "3", first_name: "Bilen", last_name: "Eshetu")
damion = User.create!(username: "4", email: "4@4.com", password: "4", first_name: "Damion", last_name: "Wiltshire")
uni = User.create!(username: "5", email: "5@5.com", password: "5", first_name: "Unicorn", last_name: "Princess")
User.create!(username: "6", email: "6@6.com", password: "6", first_name: "Snoop", last_name: "Dogg")
User.create!(username: "7", email: "7@7.com", password: "7", first_name: "Justin", last_name: "Time")
User.create!(username: "8", email: "8@8.com", password: "8", first_name: "Dancing", last_name: "Queen")
User.create!(username: "9", email: "9@9.com", password: "9", first_name: "Jake", last_name: "Steak")

puts "#{User.count} users created!"

# Events
drake = Event.create!(user: sofia, name: "Drake Concert", date: "2020-01-15")
afro_b = Event.create!(user: sofia, name: "Afro B Concert", date: "2019-12-14")
junebaby = Event.create!(user: noah, name: "Dinner at Junebaby", date: "2019-09-25")
micky_ds = Event.create!(user: noah, name: "Dinner at McDonalds", date: "2019-12-25")
tahoe = Event.create!(user: bilen, name: "Weekend in Tahoe", date: "2020-05-25")
groceries = Event.create!(user: damion, name: "Groceries", date: "2020-09-01")
bills = Event.create!(user: damion, name: "Bills", date: "2020-09-15")

puts "#{Event.count} events created!"

# Expenses
d_tickets = Expense.create!(event: drake, user: sofia, name: "Tickets", amount: 300, date: "2020-01-15")
d_swag = Expense.create!(event: drake, user: noah, name: "Swag", amount: 100, date: "2020-01-15")
d_uber = Expense.create!(event: drake, user: damion, name: "Uber", amount: 70, date: "2020-01-15")

a_tickets = Expense.create!(event: afro_b, user: sofia, name: "Tickets", amount: 300, date: "2019-12-14")
a_swag = Expense.create!(event: afro_b, user: noah, name: "Swag", amount: 100, date: "2019-12-14")
a_uber = Expense.create!(event: afro_b, user: bilen, name: "Uber", amount: 70, date: "2019-12-14")

j_apps = Expense.create!(event: junebaby, user: sofia, name: "Appitizers", amount: 30, date: "2019-09-25")
j_mains = Expense.create!(event: junebaby, user: noah, name: "Mains", amount: 60, date: "2019-09-25")
j_desserts = Expense.create!(event: junebaby, user: bilen, name: "Dessert", amount: 45, date: "2019-09-25")

electricity = Expense.create!(event: bills, user: sofia, name: "Electricity", amount: 200, date: "2019-09-17")
rent = Expense.create!(event: bills, user: damion, name: "Rent", amount: 2000, date: "2019-09-20")
cable = Expense.create!(event: bills, user: bilen, name: "Cable", amount: 100, date: "2019-09-24")

puts "#{Expense.count} expenses created!"

# User -> Event
UsersEvent.create!(event: drake, user: noah)
UsersEvent.create!(event: drake, user: damion)

UsersEvent.create!(event: afro_b, user: noah)
UsersEvent.create!(event: afro_b, user: bilen)

UsersEvent.create!(event: junebaby, user: bilen)
UsersEvent.create!(event: junebaby, user: sofia)

UsersEvent.create!(event: bills, user: sofia)
UsersEvent.create!(event: bills, user: bilen)

puts "#{UsersEvent.count} user -> event created!"

# User -> Expense
UsersExpense.create!(expense: d_tickets, user: noah)
UsersExpense.create!(expense: d_tickets, user: damion)
UsersExpense.create!(expense: d_swag, user: damion)
UsersExpense.create!(expense: d_swag, user: sofia)
UsersExpense.create!(expense: d_uber, user: noah)
UsersExpense.create!(expense: d_uber, user: sofia)

UsersExpense.create!(expense: a_tickets, user: noah)
UsersExpense.create!(expense: a_tickets, user: bilen)
UsersExpense.create!(expense: a_swag, user: bilen)
UsersExpense.create!(expense: a_swag, user: sofia)
UsersExpense.create!(expense: a_uber, user: noah)
UsersExpense.create!(expense: a_uber, user: sofia)

UsersExpense.create!(expense: j_apps, user: noah)
UsersExpense.create!(expense: j_apps, user: bilen)
UsersExpense.create!(expense: j_mains, user: sofia)
UsersExpense.create!(expense: j_mains, user: bilen)
UsersExpense.create!(expense: j_desserts, user: noah)
UsersExpense.create!(expense: j_desserts, user: sofia)

UsersExpense.create!(expense: electricity, user: damion)
UsersExpense.create!(expense: electricity, user: bilen)
UsersExpense.create!(expense: rent, user: bilen)
UsersExpense.create!(expense: rent, user: sofia)
UsersExpense.create!(expense: cable, user: damion)
UsersExpense.create!(expense: cable, user: sofia)