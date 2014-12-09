# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create!(first_name: (Faker::Name.first_name).to_s,
  			   last_name: (Faker::Name.last_name).to_s,
               email: (Faker::Internet.safe_email).to_s,
               bio: (Faker::Lorem.paragraphs(3)).to_s,
               password: (Faker::Lorem.word).to_s)           
end

users = User.order(:created_at)
category = ["tech","finance","art","music","food","culture"]
10.times do
  title = (Faker::Lorem.words(4)).to_s
  random_cat = category.shuffle.first 
  users.each {|user| user.articles.create!(title: title, content: (Faker::Lorem.paragraphs(3)).to_s, category: random_cat)}
end