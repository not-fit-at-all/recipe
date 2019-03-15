#open the file
#define AvailableIngredients
#convert the file into AvailableIngredient
require "date"
require_relative "Models/KnownIngredient"
require_relative "Models/AvailableIngredient"
require_relative "Models/Cuisine"
require_relative "Controllers/Controller"
require_relative "Views/View"

known_ingredients = KnownIngredient.list
available_ingredients = AvailableIngredient.list#contains AvailableIngredient
cuisines = Cuisine.list(known_ingredients, available_ingredients)

#show list of available ingredients - I should probably make it a class method
View.show_ai(available_ingredients)

high_priority = AvailableIngredient.extract(available_ingredients, 1)
View.show_ai(high_priority)
puts "===================================="
midium_priority = AvailableIngredient.extract(available_ingredients, 3,2)
View.show_ai(midium_priority)
puts "===================================="
low_priority = AvailableIngredient.extract(available_ingredients, 7,4)
View.show_ai(low_priority)
puts "===================================="
garbage = AvailableIngredient.extract(available_ingredients, -1,-999999)
puts "Throw away;"
View.show_ai(garbage)

View.show_cuisines(cuisines)


=begin
things left to be worked on
using extracted lists of ai as keys, find cuisines
=end
