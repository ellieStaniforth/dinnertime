class RecipesController < ApplicationController

  def home
    @recipes = Recipe.all
  end
end