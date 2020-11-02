FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password { "abc123" }
    password_confirmation {password}
    first_name { "ぜんかく" }
    last_name { "ぜんかく" }
    first_name_kana { "ゼンカクカナ" }
    last_name_kana { "ゼンカクカナ" }
    birth_date { "2020-01-01" }
  end
end
