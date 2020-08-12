FactoryBot.define do
  factory :user do
    family_name { Faker::Lorem.characters(number:10) }
    given_name { Faker::Lorem.characters(number:10) }
    family_name_kana { "カタカナ" }
    given_name_kana { "カタカナ" }
    email { Faker::Internet.email }
    phone_number { "1234567890" }
    password { "password" }
    password_confirmation { "password" }
  end
end

