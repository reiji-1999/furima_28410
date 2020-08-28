FactoryBot.define do
  factory :user do
    nickname                 { Faker::Internet.username(specifier: 1..40) }
    email                    { Faker::Internet.free_email }
    password                 { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation    { password }
    family_name              { '山田' }
    first_name               { '一郎' }
    name_reading_family_name { 'ヤマダ' }
    name_reading_first_name  { 'イチロウ' }
    birthday                 { Faker::Date.birthday(min_age: 5, max_age: 100) }
  end
end
