class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:show]
  def index
    @exhibitions = Exhibition.all
  end
  
  def new
    @exhibition = Exhibition.new
    @parents = Category.where(ancestry: nil)
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

  def show
  
  end

  def edit

  end

  def search
    if params[:l_cat]
      @m_cat = Category.find(params[:l_cat]).children
    else
      @s_cat = Category.find(params[:m_cat]).children
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def exhibition_params
    params.require(:exhibition).permit(:price,:shipping_date,:shipping_charges,:categorys_name,:item_description,:item_status, :item_name, :prefecture_id).merge(user_id: current_user.id)
    # params.require(:exhibition).permit(:price,:shipping_date,:shipping_area,:shipping_charges,:categorys_name,:item_description,:item_status, :item_name).merge(user_id: current_user.id)
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

end