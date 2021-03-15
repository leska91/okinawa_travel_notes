FactoryBot.define do
  factory :user do
    nickname              { 'test44' }
    email {Faker::Internet.free_email}
    password              { 'test44' }
    password_confirmation { password }
  end
end