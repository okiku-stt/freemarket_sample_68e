class ExhibitionsController < ApplicationController

  require 'payjp'
  before_action :set_exhibition, only: [:show, :edit, :update, :buy]
  before_action :set_user, only: [:edit, :update]
  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :set_card, only: [:buy, :pay]
  def index
    @exhibitions = Exhibition.all.includes(:user).order("created_at DESC")
    @categories = Category.roots
  end

  def new
    @categories = Category.roots
    @exhibition = Exhibition.new
    @image = @exhibition.images.new
  end
  
  def create
    @categories = Category.roots
    @exhibition = Exhibition.new(exhibition_params)
    respond_to do |format|
      if params[:exhibition][:images_attributes] != nil
        if @exhibition.save
          format.html{redirect_to modal_exhibitions_path}
        else
          flash.now[:alert] = '必須項目を入力してください。'
          @image = @exhibition.images.new
          format.html{render action: 'new'}
        end
      else
        flash.now[:alert] = '必須項目を入力してください。'
        @image = @exhibition.images.new
        format.html{render action: 'new'}
      end
    end
  end
  
  def modal
  end
  
  def search
    @exhibitions = Exhibition.search(params[:keyword])
  end

  def show
    @images = Image.where(exhibition_id: params[:id]).order("created_at DESC")
    if user_signed_in?
      @deal = Exhibition.find_by(deal: params[:deal])
      @exhibition = Exhibition.find(params[:id])
      @categories = Category.find(params[:id])
      render :show
    else
      redirect_to user_session_path method: :post
    end
    
  end
  
  def edit
    @categories = Category.roots
    @exhibition.images.new
  end
  
  def update
    @categories = Category.roots
    if @exhibition.update(exhibition_params)
      redirect_to root_path, notice: '編集が完了しました。'
    else
      @exhibition = Exhibition.find(@exhibition.id)
      flash.now[:alert] = '必須項目を入力してください。'
      render :edit
    end
  end
  
  # ---pay.jpの処理---
  def buy
    if @card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
  
  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    exhibition = Exhibition.find(params[:id])
    
    Payjp::Charge.create(
    amount: exhibition.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: @card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    
    exhibition.update!(deal: 1)
    redirect_to action: 'done' #完了画面に移動
  end
  # ---pay.jpの処理ここまで---

  def category_children  
    @category_children = Category.find(params[:parent]).children 
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:child]).children
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

  def destroy
    @exhibition = Exhibition.find(params[:id])
    @exhibition.destroy
    redirect_to root_path, notice: '削除が完了しました。'
  end

  def exhibition_params
    params.require(:exhibition).permit(:price,:shipping_date,:category_id,:prefecture_id,:shipping_charges,:item_description,:item_status, :item_name, :brand, images_attributes: [:image,  :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  def set_user
    @user = Exhibition.find_by(user_id: params[:user_id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

end