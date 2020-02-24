class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:show, :edit]
  before_action :set_user, only: [:show, :edit]



  def index
    @exhibitions = Exhibition.all
  end

  def new

    @exhibition = Exhibition.new
  end
  
  def create
    @exhibition = Exhibition.new(exhibition_params)
    
    if @exhibition.save
      
      redirect_to modal_exhibitions_path
    else
      render new_exhibition_path
    end
    
  end

  def show
    
  end

  def edit

  end


 

  private
  def exhibition_params
    params.require(:exhibition).permit(:price,:shipping_date,:shipping_area,:shipping_charges,:categorys_name,:item_description,:item_status, :item_name).merge(user_id: current_user.id)

  end


  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

end