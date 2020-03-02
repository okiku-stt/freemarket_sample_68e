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