FactoryBot.define do
  factory :record do
    area_id { 3 }
    text    { 'テストテスト' }
    association :user

    after(:build) do |record|
      record.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
