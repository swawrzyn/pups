# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Pup.destroy_all
Booking.destroy_all
Review.destroy_all


10.times do
  User.create!(open_id: Faker::IDNumber.valid,
               avatarUrl:"https://wx.qlogo.cn/mmopen/vi_32/t79CAiczXkYA0NBQk1oic91fOrgibdkSns9VopiccNJgCdibxzlib5csooJtY1vJJ3ibkibQwVibeU0ylDRfdIB98LR7rSQ/132",
               nickName: "tommy")
end

User.all.each do |user|
  Pup.create!(user: user, name: Faker::Company.name,location: Faker::Address.street_address,description: Faker::GameOfThrones.quote, price: Random.new.rand(100..1000),image: "https://i.pinimg.com/originals/89/0a/8a/890a8a833c59bf6b880e44f9ad146050.jpg")
end

Booking.create(pup: Pup.first, user: User.last, time_start: "2018-11-17", time_end: "2018-11-18", accepted: true)
Booking.first.reviews.create(content: "this space was great", rating: 4, user: User.first)
