require 'rails_helper'

describe Card do
  describe '#pay' do

    it "card_idがないと登録できない" do
      card = build(:card, card_id: nil)
      card.valid?
      expect(card.errors[:card_id]).to include()
    end

    it "customer_idがないと登録できない" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include()
    end

  end
end