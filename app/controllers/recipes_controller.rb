class RecipesController < ApplicationController

  def index
    if params[:search]
      @recipes = Recipe.search(params[:search])
    else 
      @recipes = Recipe.all
    end
  end

  private 

  def recipe_params
    params.require(:recipe).permit(:search)
  end
end