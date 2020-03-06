require 'rails_helper'

describe Image do
  describe '#create' do
    # 1. exhibition_id,imageが存在すれば登録できること
    it "is valid with a exhibition_id,image" do
      exhibition = create(:exhibition)
      image = build(:image, exhibition_id: exhibition.id)
      expect(image).to be_valid
    end
    # 2. imageが空では登録できないこと
    it "is invalid without a image" do
      image = build(:image, image: nil)
      image.valid?
      expect(image.errors[:image]).to include("can't be blank")
    end    
  end
end