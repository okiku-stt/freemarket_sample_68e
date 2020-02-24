class CategoriesController < ApplicationController
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
end
