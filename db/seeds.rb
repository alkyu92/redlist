# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

name = ['sudo','admin','normal']
email = ['sudo@sudo.sudo','admin@admin.admin','normal@normal.normal']
password = '123456'
password_confirmation = '123456'
privilege = ['sudo', 'admin', 'normal']

for i in 0...3 do
User.create!(
  name: name[i],
  email: email[i],
  password: password,
  password_confirmation: password_confirmation,
  privilege: privilege[i]
)
end
