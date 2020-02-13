FactoryBot.define do
  factory :card do
    user { nil }
    card_number { 1 }
    year { 1 }
    month { 1 }
  end
end
