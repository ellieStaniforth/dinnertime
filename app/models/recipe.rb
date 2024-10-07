class Recipe < ApplicationRecord
  #TODO validations
   validates :title, presence: true
   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients


  def self.cleanup_search(search)
    search = search.gsub(/[' '.*+`]/, ',').split(",")
    search = search.reject { |el| el.empty? }

    search
  end

  def self.one_ingredient_recipie(search)
    #need to find a subset of the string
    ingredient = Ingredient.where("name ILIKE ?", "%#{search[0]}%")
    if ingredient
      recipes = Recipe.joins(:ingredients).where("ingredients.name ILIKE ?", "%#{search[0]}%")

      return recipes.to_a
    else
      Recipe.all
    end
  end

  def self.multiple_ingredient_recipe(search)
    Recipe.all
  end

  def self.search(search)
    search = cleanup_search(search)

    if search.length == 1
      one_ingredient_recipie(search)
    else 
      multiple_ingredient_recipe(search)
    end
  end
end