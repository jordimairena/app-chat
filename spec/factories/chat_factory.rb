FactoryGirl.define do
  factory :chat do
    message {Faker::Lorem.sentence}
    association :sender, factory: :user
    association :receiver, factory: :user
  end
end