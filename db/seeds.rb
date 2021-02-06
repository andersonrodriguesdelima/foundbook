require 'factory_bot'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.transaction do
  admin = User.create!(
    name: 'Administrator',
    email: 'admin@admin.com',
    password: 'admin123',
    password_confirmation: 'admin123'
  )
  authors = FactoryBot.create_list(:author, 3)
  
  10.times do
    FactoryBot.create(:book, author: authors.shuffle.first)
  end
end