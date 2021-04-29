# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(first_name: 'Kristen', last_name: 'Orue', email: 'oruek@oregonstate.edu', password: 'password', role: 'admin')
u2 = User.create(first_name: 'Marji', last_name: 'Symonds', email: 'symondsm@oregonstate.edu', password: 'password', role: 'admin')
u3 = User.create(first_name: 'Michael', last_name: 'Tornatta', email: 'tornattm@oregonstate.edu', password: 'password', role: 'admin')
u4 = User.create(first_name: 'Yong', last_name: 'Bakos', email: 'yong.bakos@osucascades.edu', password: 'password', role: 'admin')


# remove after 4.29.21 deployment
u5 = User.create(first_name: 'Caroline', last_name: 'Danielson', email: 'caroline@hdffa.org', password: 'password', role: 'admin')
u6 = User.create(first_name: 'Annie', last_name: 'Nichols', email: 'annie@hdffa.org', password: 'password', role: 'admin')
u7 = User.create(first_name: 'Laurie', last_name: 'Wayne', email: 'lauriewayne@gmail.com', password: 'password', role: 'admin')
u8 = User.create(first_name: 'Chantel', last_name: 'Welch', email: 'chantel@hdffa.org', password: 'password', role: 'admin')



