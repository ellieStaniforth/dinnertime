class Recipe < ApplicationRecord
   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients

   def self.search(search)
    if search
      ingredient = Ingredient.find_by(name: search)
      if ingredient
        recipies = Recipe.joins(:ingredients).where("ingredients.name ILIKE ?", "%#{search}%")

        return recipies
      else
        Recipe.all
      end
      Recipe.all
    end
   end
end