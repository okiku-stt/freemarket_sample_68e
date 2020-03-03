FactoryBot.define do
  factory :card do
    user
    # card_number { "0000000000000000" }
    # year { "00" }
    # month { "00" }
    card_id {"00000000000000000000000000000000"}
    customer_id {"00000000000000000000000000000000"}
  end
  # おそらくモックを使うためファクトリーボットは使用しない
end
