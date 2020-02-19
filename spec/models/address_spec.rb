require 'rails_helper'

# RSpec.describe Address, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Address do
  describe '#create' do
    # 1. 全て存在する場合に登録できる
    it "is valid with a ship_family_name, ship_last_name, ship_j_family_name, ship_j_last_name, postal_code, prefectures, municipalities, house_number" do
      user = build(:address)
      expect(user).to be_valid
    end
    # 2. ship_family_nameが空では登録できない
    it "is invalid without a ship_family_name" do
      user = build(:address, ship_family_name: nil)
      user.valid?
      expect(user.errors[:ship_family_name]).to include("can't be blank")
    end

    # 3. ship_last_nameが空では登録できない
    it "is invalid without a ship_last_name" do
      user = build(:address, ship_last_name: nil)
      user.valid?
      expect(user.errors[:ship_last_name]).to include("can't be blank")
    end

    # 4. ship_j_family_nameが空では登録できない
    it "is invalid without a ship_j_family_name" do
      user = build(:address, ship_j_family_name: nil)
      user.valid?
      expect(user.errors[:ship_j_family_name]).to include("can't be blank")
    end

    # 5. ship_j_last_nameが空では登録できない
    it "is invalid without a ship_j_last_name" do
      user = build(:address, ship_j_last_name: nil)
      user.valid?
      expect(user.errors[:ship_j_last_name]).to include("can't be blank")
    end

    # 6. postal_codeが空では登録できない
    it "is invalid without a postal_code" do
      user = build(:address, postal_code: nil)
      user.valid?
      expect(user.errors[:postal_code]).to include("can't be blank")
    end

    # 7. prefecturesが空では登録できない
    it "is invalid without a prefectures" do
      user = build(:address, prefectures: nil)
      user.valid?
      expect(user.errors[:prefectures]).to include("can't be blank")
    end

    # 8. municipalitiesが空では登録できない
    it "is invalid without a municipalities" do
      user = build(:address, municipalities: nil)
      user.valid?
      expect(user.errors[:municipalities]).to include("can't be blank")
    end

    # 9. house_numberが空では登録できない
    it "is invalid without a house_number" do
      user = build(:address, house_number: nil)
      user.valid?
      expect(user.errors[:house_number]).to include("can't be blank")
    end
  end
end