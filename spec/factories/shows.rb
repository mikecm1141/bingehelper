FactoryBot.define do
  factory :show do
    sequence(:title)   { |n| "Show Title #{n}"       }
    sequence(:year)    { rand(1950..2018)            }
    image              { 'placeholder.png'           }
    sequence(:runtime) { [22, 30, 48, 60, 90].sample }
  end
end
