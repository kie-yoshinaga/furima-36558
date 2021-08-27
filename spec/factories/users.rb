FactoryBot.define do
  factory :user do
    nickname {"フリマ太郎"}
    email {Faker::Internet.free_email}
    password {"12345a"}
    password_confirmation {"12345a"}
    last_name {"山田"}
    first_name {"太郎"}
    last_name_reading {"ヤマダ"}
    first_name_reading {"タロウ"}
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end