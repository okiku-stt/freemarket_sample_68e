class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
 

  def index
    @exhibitions = Exhibition.all
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
    @deal = Exhibition.find_by(deal: params[:deal])
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
    params.require(:exhibition).permit(:price,:shipping_date,:categorys_name,:prefecture_id,:shipping_charges,:item_description,:item_status, :item_name, :brand, images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end


  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

end