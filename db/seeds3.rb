# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

arr = ["Part-time Jobs", "Job Hunting", "Scholarships", "Events", "Promotions"]
for i in arr
  Category.create!(name: i)
end

name_arr = ["ali", "abu", "aku"]
email_arr = ["ali@ali.ali", "abu@abu.abu","aku@aku.aku"]
pass_arr = ["aliali","abuabu","akuaku"]
privilege_arr = ["sudo", "admin", "normal"]
for n in 0..2
  User.create!( name: name_arr[n],
                email: email_arr[n],
                password: pass_arr[n],
                password_confirmation: pass_arr[n],
                privilege: privilege_arr[n])
end

100.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name, email: email, password: password,
              password_confirmation: password, privilege: "normal")
end

users = User.order("created_at").take(10)

users.each do |n|
  name = n.name
  title = Faker::Lorem.sentence(1)
  amount = "$" + Random.rand(100..1000).to_s
  description = Faker::Lorem.paragraph(20)
  requirement = Faker::Lorem.paragraph(10)
  address = Faker::Address.street_address
  contact = Faker::PhoneNumber.cell_phone
  email = n.email
  bizhour = "9:00 ~ 17:00"
  website = "www." + name + ".com"
  user_id = Random.rand(1..10)
  category_id = Random.rand(1..5)
  validity = Time.now + 3600*n.id

  users.each {|user| user.advertisements.create!(
    name: name,
    title: title,
    amount: amount,
    description: description,
    requirement: requirement,
    address: address,
    contact: contact,
    email: email,
    bizhour: bizhour,
    website: website,
    user_id: user_id,
    category_id: category_id,
    validity: validity
    )}
end


    users.each do
      title = Faker::Lorem.sentence(1)
      story = Faker::Lorem.paragraph(5)

      users.each {|user| user.stories.create!(
        story: story,
        title: title,
        )}

      end

      users.each do |n|
        name = n.name
        department = Faker::Lorem.sentence(1)
        description = Faker::Lorem.paragraph(3)
        address = Faker::Address.street_address
        phone = Faker::PhoneNumber.cell_phone
        email = n.email


        users.each {|user| user.groups.create!(
          name: name,
          department: department,
          description: description,
          address: address,
          phone: phone,
          email: email
          )}

        end
