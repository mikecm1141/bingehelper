FactoryBot.define do
  factory :user do
    name                  { 'User' }
    sequence(:email)      { |n| "user#{n}@usertest.org" }
    password              { 'password' }
    password_confirmation { 'password' }
    admin                 { false }
  end

  factory :admin, class: User do
    name                  { 'Admin' }
    sequence(:email)      { |n| "admin#{n}@usertest.org" }
    password              { 'password' }
    password_confirmation { 'password' }
    admin                 { true }
  end
end
