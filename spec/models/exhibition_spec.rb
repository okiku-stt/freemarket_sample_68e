require 'rails_helper'

describe Exhibition do
  describe '#create' do
    # 1. price,shipping_date,category_id,prefecture_id,shipping_charges,item_description,item_status, item_name, images_attributesが存在すれば登録できること
    it "is valid with a price,shipping_date,category_id,prefecture_id,shipping_charges,item_description,item_status,item_name" do
      user = create(:user)
      category = create(:category)
      exhibition = build(:exhibition, user_id: user.id, category_id: category.id)
      expect(exhibition).to be_valid
    end
    # 2. item_nameが空では登録できないこと
    it "is invalid without a item_name" do
      exhibition = build(:exhibition, item_name: nil)
      exhibition.valid?
      expect(exhibition.errors[:item_name]).to include("can't be blank")
    end
    # 3. item_descriptionが空では登録できないこと
    it "is invalid without a item_description" do
      exhibition = build(:exhibition, item_description: nil)
      exhibition.valid?
      expect(exhibition.errors[:item_description]).to include("can't be blank")
    end
    # 4. item_statusが空では登録できないこと
    it "is invalid without a item_status" do
      exhibition = build(:exhibition, item_status: nil)
      exhibition.valid?
      expect(exhibition.errors[:item_status]).to include("can't be blank")
    end
    # 5. shipping_chargesが空では登録できないこと
    it "is invalid without a shipping_charges" do
      exhibition = build(:exhibition, shipping_charges: nil)
      exhibition.valid?
      expect(exhibition.errors[:shipping_charges]).to include("can't be blank")
    end
    # 6. prefecture_idが空では登録できないこと
    it "is invalid without a prefecture_id" do
      exhibition = build(:exhibition, prefecture_id: nil)
      exhibition.valid?
      expect(exhibition.errors[:prefecture_id]).to include("can't be blank")
    end
    # 7. shipping_dateが空では登録できないこと
    it "is invalid without a shipping_date" do
      exhibition = build(:exhibition, shipping_date: nil)
      exhibition.valid?
      expect(exhibition.errors[:shipping_date]).to include("can't be blank")
    end
    # 8. priceが空では登録できないこと
    it "is invalid without a price" do
      exhibition = build(:exhibition, price: nil)
      exhibition.valid?
      expect(exhibition.errors[:price]).to include("can't be blank")
    end
    # 9. category_idが空では登録できないこと
    it "is invalid without a category_id" do
      exhibition = build(:exhibition, category_id: nil)
      exhibition.valid?
      expect(exhibition.errors[:category_id]).to include("can't be blank")
    end
  end
end