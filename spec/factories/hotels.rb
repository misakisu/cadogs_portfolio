FactoryBot.define do
  factory :hotel do
    name { Faker::Lorem.characters(number:5) }
    price { "1500" }
    address { Faker::Lorem.characters(number:5) }
    phone_number { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    introduction { Faker::Lorem.characters(number:5) }
  end
end
