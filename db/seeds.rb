# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(first_name: 'Kristen', last_name: 'Orue', email: 'oruek@oregonstate.edu', password: 'password', role: 'admin')
u2 = User.create(first_name: 'Marji', last_name: 'Symonds', email: 'symondsm@oregonstate.edu', password: 'password', role: 'admin')
u3 = User.create(first_name: 'Michael', last_name: 'Tornatta', email: 'stornattm@oregonstate.edu', password: 'password', role: 'admin')


