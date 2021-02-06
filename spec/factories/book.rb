FactoryBot.define do
  factory :book, class: 'Book' do
    name { Faker::Book.title }
    description { Faker::Lorem.sentence }
    image_url { 'www.google.com/image.jpg' }
    author { Author.last || create(:author) }
  end
end
