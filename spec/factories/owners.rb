FactoryBot.define do
  factory :owner do
    name { Faker::Lorem.characters(number:10) }
    email { Faker::Internet.email }
    phone_number { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    password { "password" }
    password_confirmation { "password" }
  end
end
