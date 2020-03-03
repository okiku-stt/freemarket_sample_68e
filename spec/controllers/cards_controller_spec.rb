require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  let(:params) { { user_id: user.id} }
  # カード登録にはユーザIDがいる
  describe "GET #new" do
    context 'log in'do
      before do
        login user
      end
      # ログインプラス保存ができる前提（モック使用）でのテストコード
      context 'indexに登録したカード情報が表示できる' do
        subject {
          post :pay,
          # payのアクションはpay.jpでやるのでここでのテストコードは不要と思われる
          allow(Payjp::Charge).to receive(:create).and_return(PayjpMock.prepare_valid_charge)
        }
        it "カードが空白ならnewページで登録できる" do
          expect(response).to redirect_to(cards_path)
        end
        # コードの生後はともかくsubjectにはpay.jpでは行ってきたトークンが入っている
        it "カード情報ありならnewページで表示" do
          expect{subject}.to change(Card, :count).by(1)
          # :count).by(1)と記述することによって、
          # Cardモデルのレコードの総数が1個増えたかどうかを確かめることができます
        end

        it "カードが登録できたらindexページへ戻る" do
          expect(response).to redirect_to(cards_path)
        end
      end

      context 'can not save' do
        let(:invalid_params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message, content: nil, image: nil) } }

      end
    

    context 'not log in' do
      expect(response).to redirect_to(new_user_session_path)
    end
  
  end
end

