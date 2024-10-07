
`curl https://pennylane-interviewing-assets-20220328.s3.eu-west-1.amazonaws.com/recipes-en.json.gz > recipes-en.json.gz && gzip -dc recipes-en.json.gz > recipes-en.json`

text_from_file = File.read('recipes-en.json')

Recipe.delete_all

JSON.parse(text_from_file).each do |object|
  next if Recipe.find_by(title: object['title']).present?
  r = Recipe.create!(title: object['title'], cook_time: object['cook_time'], prep_time: object['prep_time'], rating: object['rating'], ingredients: object['ingredients'].join(', '))

  puts r.title
end
