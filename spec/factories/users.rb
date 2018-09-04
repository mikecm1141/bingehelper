FactoryBot.define do
  factory :user do
    name                  { 'User'                      }
    sequence(:email)      { |n| "user#{n}@usertest.org" }
    password              { 'password'                  }
    password_confirmation { 'password'                  }
    role                  { 0                           }
  end

  factory :admin, class: User do
    name                  { 'Admin'                      }
    sequence(:email)      { |n| "admin#{n}@usertest.org" }
    password              { 'password'                   }
    password_confirmation { 'password'                   }
    role                  { 1                            }
  end
end
