class RecipesController < ApplicationController

  def index
    if params[:search].present?
      @recipes = Recipe.search_by_ingredients(params[:search]).page(params[:page])
    else 
      @recipes = Recipe.all.page(params[:page])
    end
  end

  def random
    @recipes = Recipe.order("random()").page(0)

    render :index
  end
end