FactoryBot.define do
  factory :rating do
    score      { rand(1..10) }
    bingecount { rand(1..20) }
    user
  end

  factory :rating_no_default_user, class: Rating do
    score      { rand(1..10) }
    bingecount { rand(1..20) }
  end
end
