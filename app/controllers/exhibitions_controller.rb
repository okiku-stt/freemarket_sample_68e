class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:show]
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
    # @exhibition = Exhibition.find(params[:id])
    # @user = Userfind(params[:id])
  end

  def create

  end

  def edit
    @exhibition = Exhibition.find(params[:id])
    @user = User.find(params[:id])
  end


  private

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
    @user = User.find(params[:id])
  end

end