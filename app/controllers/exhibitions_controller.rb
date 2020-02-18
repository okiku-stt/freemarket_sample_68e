class ExhibitionsController < ApplicationController
  def index
    
  end
  
  def new
    @exhibition = Exhibition.new
  end
  
  def create
    @exhibition = Exhibition.create(exhibition_params)
    redirect_to exhibitions_path
  end

  private
  def exhibition_params
    params.require(:exhibition).permit(:price,:shipping_date)
  end
end