class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:show]
  def index
    
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

  def modal
    
  end

  def show
   
  end

  private
  def exhibition_params
    params.require(:exhibition).permit(:price,:shipping_date,:shipping_area,:shipping_charges,:bland_id,:categorys_id,:user_id)

    # if user_signed_in?
    #   @exhibition = Exhibition.find(params[:id])
    # else
    #   redirect_to user_session_path
    # end
    @exhibitions = Exhibition.all

  end

  private

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

end