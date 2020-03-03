require 'rails_helper'

describe Image do
  describe '#create' do
    # 1. imageが空では登録できないこと
    it "is invalid without a image" do
      exhibition = create(:exhibition)
      image = build(:image, exhibition_id: exhibition.id)
      # user = create(:user)
      # category = create(:category)
      
      # image = build(:image, image: nil)
      image.valid?
      expect(image.errors[:image]).to include("can't be blank")
    end
  end
end