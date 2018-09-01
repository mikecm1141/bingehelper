FactoryBot.define do
  factory :user do
    name                  { 'User' }
    email                 { 'user@usertest.org' }
    password              { 'password' }
    password_confirmation { 'password' }
    admin                 { false }
  end

  factory :admin, class: User do
    name                  { 'Admin' }
    email                 { 'admin@usertest.org' }
    password              { 'password' }
    password_confirmation { 'password' }
    admin                 { true }
  end
end
