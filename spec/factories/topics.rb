FactoryBot.define do
  factory :topic do
    sentence_id  { 2 }
    description { 'explanation' }

    association :user
  end
end