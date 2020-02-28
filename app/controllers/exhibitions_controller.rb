class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @exhibitions = Exhibition.all
    @categories = Category.roots
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
      if @exhibition.save
          params[:exhibition_images][:image].each do |image|
            @exhibition.images.create(image: image, exhibition_id: @exhibition.id)
          end
        format.html{redirect_to modal_exhibitions_path}
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
    @deal = Exhibition.find_by(deal: params[:deal])
    @exhibition = Exhibition.find(params[:id])

    # @images = Image.where(exhibition_id: 3)
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

  def category_children
    @category_children = Category.find(params[:parent]).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:child]).children
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
    params.require(:exhibition).permit(:price,:shipping_date,:category_id,:prefecture_id,:shipping_charges,:item_description,:item_status, :item_name, :brand, images_attributes: [:image, :id]).merge(user_id: current_user.id)
    # params.require(:exhibition).permit(:category_id, :shipping_charges, :prefecture_id, :shipping_date, :price, :item_name, :item_status, :prefecture, :item_description, images_attributes: [:image]).merge(user_id: current_user.id)
  end


  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end