FactoryBot.define do
  factory :rating do
    score      { rand(1..10) }
    bingecount { rand(1..20) }
    user
    show
  end
end
