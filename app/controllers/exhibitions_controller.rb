class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:show, :edit]
  before_action :set_uesr, only: [:show, :edit]



  def index
    # if user_signed_in?
    #   @exhibition = Exhibition.find(params[:id])
    # else
    #   redirect_to user_session_path
    # end
    @exhibitions = Exhibition.all
  end

  def new

  end

  def show
    
  end

  def create

  end

  def edit
    
  end


  private

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  def set_uesr
    @user = User.find(params[:id])
  end

end