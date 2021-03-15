FactoryBot.define do
  factory :message do
    content {'テストコード'}
    association :user
    association :room
  end
end
