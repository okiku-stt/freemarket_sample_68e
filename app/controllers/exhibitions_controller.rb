class ExhibitionsController < ApplicationController
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


  private
  def exhibition_params
    params.require(:exhibition).permit(:price,:shipping_date)
  end
end