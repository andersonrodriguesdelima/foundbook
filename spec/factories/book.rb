FactoryBot.define do
  factory :book, class: 'Book' do
    name { Faker::Book.title }
    description { Faker::Lorem.sentence }
    image_url { 'www.google.com/image.jpg' }
    author_id { Author&.last&.id || create(:author).id }
  end
end
