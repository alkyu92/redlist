# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

arr = ["Part-Time Jobs", "Job Huntings", "Scholarships", "Events", "Promotions"]
for i in arr
  Category.create!(name: i)
end

name_arr = ["ali", "kang", "ajif", "kobayashi", "user"]
email_arr = ["ali@ali.ali", "kang@kang.kang","ajif@ajif.ajif","kobayashi@kobayashi.kobayashi", "user@user.user"]
pass_arr = ["123456","123456","123456","123456","123456"]
privilege_arr = ["sudo","sudo","sudo", "admin", "normal"]

for n in 0..4
  User.create!( name: name_arr[n],
                email: email_arr[n],
                password: pass_arr[n],
                password_confirmation: pass_arr[n],
                privilege: privilege_arr[n])
end

occupation = ["Professor","Student","Staff"]
for i in occupation
  Occupation.create!(name: i)
end
