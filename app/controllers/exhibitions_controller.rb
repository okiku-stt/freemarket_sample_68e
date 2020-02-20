class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:show, :edit]
  before_action :set_user, only: [:show, :edit]



  def index
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

  def set_user
    @user = User.find(params[:id])
  end

end