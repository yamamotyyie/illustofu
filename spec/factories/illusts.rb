FactoryBot.define do
  factory :illust do
    title     {"テスト"}
    text     {"タイトル"}

    after(:build) do |illust|
      illust.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
