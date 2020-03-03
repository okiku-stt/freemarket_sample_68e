require 'rails_helper'

describe Card do
  describe '#pay' do
    # it "expectの引数にしたインスタンスが全てのバルデーションをクリアした場合" do
    #   card = create(:card)
    #   expect(card).to be_valid?
    # end

    # it "userがログインしていなければ登録できない" do
    #   user = create(:user)
    #     # ↑ここに入れてみる 
    #   allow(Payjp::Charge).to receive(:create).and_return(PayjpMock.prepare_valid_charge)
    #   expect(card).to be_valid?
    # end

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

    # it "有効期限の月が空欄の場合は登録できない" do
    #   card = build(:card, mounth: nil)
    #   card.be_valid?
    # end
  end
end