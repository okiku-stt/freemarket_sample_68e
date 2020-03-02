class ExhibitionsController < ApplicationController
  require 'payjp'
  before_action :set_exhibition, only: [:show, :edit, :update, :buy]
  before_action :set_user, only: [:edit, :update]


  def index
    @exhibitions = Exhibition.all.includes(:user).order("created_at DESC")
    @categories = Category.roots
  end

  def new
    @exhibition = Exhibition.new
    @categories = Category.roots
    # @category_children = Category.find(params[:parent]).children 
  end
  
  def create
    @exhibition = Exhibition.new(exhibition_params)
    if @exhibition.save
      redirect_to modal_exhibitions_path
    else
      render new_exhibition_path
    end
    
  end

  def modal
  end

  def search
    @exhibitions = Exhibition.search(params[:keyword])
  end

  def show
    # @deal = Exhibition.find_by(deal: params[:deal])
    if user_signed_in?
      render :show
    else
      redirect_to user_session_path method: :post
    end
  end

  def edit
  end
    # ---pay.jpの処理---
  def buy
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    exhibition = Exhibition.find(params[:id])
    Payjp::Charge.create(
    amount: exhibition.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    redirect_to action: 'done' #完了画面に移動
  end
  # ---pay.jpの処理ここまで---


  def update
    if @exhibition.update(exhibition_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def search_children
    @categories = Category.roots
    respond_to do |format|
      format.html
      format.json {
        @children = Category.find(params[:parent_id]).children
      }
    end
  end

  def search_grandchildren
    respond_to do |format|
      format.html
      format.json {
        @grandchildren = Category.find(params[:child_id]).children
      }
    end
  end

  private

  def exhibition_params
    params.require(:exhibition).permit(:price,:shipping_date,:categorys_name,:prefecture_id,:shipping_charges,:item_description,:item_status, :item_name, images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end


  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

end