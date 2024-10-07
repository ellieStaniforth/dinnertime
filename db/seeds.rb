require 'ingreedy'
text_from_file = File.read(ENV["DATA_PATH"])

JSON.parse(text_from_file).each do |object|
  next if Recipe.find_by(title: object['title']).present?
  r = Recipe.create!(title: object['title'], cook_time: object['cook_time'], prep_time: object['prep_time'], rating: object['rating'])

  ingredients = object['ingredients']
  ingredients.each do |individual_ingredient|
    begin
      result = Ingreedy.parse(individual_ingredient)
    rescue => e
      result = nil
    end

    if result&.ingredient.present?
      if Ingredient.find_by(name: result.ingredient).present?
        r.ingredients << Ingredient.find_by(name: result.ingredient)
      else
        ingredient = Ingredient.create(name: result.ingredient) 
        r.ingredients << ingredient
      end
    end
  end
  r.save!
  puts r.title
end
