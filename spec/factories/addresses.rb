FactoryBot.define do
  factory :address do
    ship_family_name {"秋元"}
    ship_last_name {"真夏"}
    ship_j_family_name {"あきもと"}
    ship_j_last_name {"まなつ"}
    postal_code {"107-0052"}
    prefectures {"東京都"}
    municipalities {"港区赤坂"}
    house_number {"8-11-27"}
    association  :user, factory: :user
  end
end
