FactoryBot.define do
  factory :rating do
    score      { rand(1..10) }
    bingecount { rand(1..12) }
    user
    show
  end
end
