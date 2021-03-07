FactoryBot.define do
  factory :user do
    nickname              { 'test11' }
    email                 { 'test@example' }
    password              { 'test11' }
    password_confirmation { password }
  end
end