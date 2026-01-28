class CategoriesController < ApplicationController
  # GET /categories
  def index
    @categories = Category.includes(:recipes).all
  end
  
  # GET /categories/1
  def show
    @category = Category.find(params[:id])
    @recipes = @category.recipes.page(params[:page]).per(9)
  end
end