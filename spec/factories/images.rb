FactoryBot.define do
  factory :image do
    image {File.open("#{Rails.root}/app/assets/images/logo.png")}
    exhibition_id  {1}

  end    
end
