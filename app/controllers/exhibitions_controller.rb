class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @exhibitions = Exhibition.all
  end

  def new
    @categories = Category.roots
    @exhibition = Exhibition.new
    @exhibition.images.build()
  end

  def create
    @categories = Category.roots
    @exhibition = Exhibition.new(exhibition_params)
    respond_to do |format|
      if @exhibition.save!
          params[:exhibition_images][:image].each do |image|
            @exhibition.images.create(image: image, exhibition_id: @exhibition.id)
          end
        format.html{redirect_to root_path}
      else
        @exhibition.images.build
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
  def category_grandchildren
    @category_grandchildren = Category.find(params[:child]).children
    end

  private
  def exhibition_params
    params.require(:exhibition).permit(:category_id, :shipping_charges, :prefecture_id, :shipping_date, :price, :item_name, :item_status, :prefecture, :item_description, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end 
end