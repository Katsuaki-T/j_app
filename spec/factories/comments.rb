FactoryBot.define do
  factory :comment do
    text  { 'comments' }

    association :topic
    association :user
  end
end
