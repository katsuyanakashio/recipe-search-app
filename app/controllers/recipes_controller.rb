class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  
  # GET /recipes
  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true)
                 .includes(:category)
                 .page(params[:page])
                 .per(9)
    
    # カテゴリーフィルター
    if params[:category_id].present?
      @recipes = @recipes.where(category_id: params[:category_id])
    end
    
    # 難易度フィルター
    if params[:difficulty].present?
      @recipes = @recipes.where(difficulty: params[:difficulty])
    end
    
    # 時間フィルター
    if params[:quick].present?
      @recipes = @recipes.where('cooking_time <= ?', 30)
    end
    
    @categories = Category.all
  end
  
  # GET /recipes/search
  def search
    @query = params[:q]
    @recipes = Recipe.search(@query)
                     .includes(:category)
                     .page(params[:page])
                     .per(9)
    render :index
  end
  
  # GET /recipes/1
  def show
    @related_recipes = Recipe.where(category_id: @recipe.category_id)
                             .where.not(id: @recipe.id)
                             .limit(3)
  end
  
  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @categories = Category.all
  end
  
  # GET /recipes/1/edit
  def edit
    @categories = Category.all
  end
  
  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)
    
    if @recipe.save
      redirect_to @recipe, notice: 'レシピが作成されました。'
    else
      @categories = Category.all
      render :new, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'レシピが更新されました。'
    else
      @categories = Category.all
      render :edit, status: :unprocessable_entity
    end
  end
  
  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'レシピが削除されました。'
  end
  
  private
  
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  
  def recipe_params
    params.require(:recipe).permit(
      :title, :description, :ingredients, :instructions,
      :cooking_time, :servings, :difficulty, :category_id, :image_url
    )
  end
end