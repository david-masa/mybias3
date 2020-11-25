FactoryBot.define do

  factory :comment do
    association :user
    association :post
    text                {"かっこいい！！"}
  end

end