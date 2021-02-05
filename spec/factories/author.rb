FactoryBot.define do
  factory :author, class: 'Author' do
    name { Faker::Book.author }
  end
end
