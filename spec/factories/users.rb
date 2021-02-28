FactoryBot.define do
  factory :user do
    nickname                  {"とーふ"}
    email                     {Faker::Internet.free_email}
    password                  {"test123"}
    password_confirmation     {password}
  end
end
