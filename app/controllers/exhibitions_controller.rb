class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
 


  def index
    @exhibitions = Exhibition.all
  end

  def new
    @exhibition = Exhibition.new
    @exhibition.images.new
    @categories = Category.roots
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
    
  end



  def edit
   
  end


  def update
    if @exhibition.update(exhibition_params)
      redirect_to root_path
    else
      render :edit
    end
    
  end

  def category_children  
    @category_children = Category.find(params[:parent]).children 
    end
  # Ajax通信で送られてきたデータをparamsで受け取り､childrenで子を取得
 
  def category_grandchildren
    @category_grandchildren = Category.find(params[:child]).children
    end

  private
  def exhibition_params
    params.require(:exhibition).permit(:price,:shipping_date,:shipping_area,:shipping_charges,:item_description,:item_status, :item_name, images_attributes: [:image, :id]).merge(user_id: current_user.id)



  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end 



end