#open the file
#define AvailableIngredients
#convert the file into AvailableIngredient
require "date"
require_relative "KnownIngredient"
require_relative "AvailableIngredient"
require_relative "Cuisine"
require_relative "Controller"
require_relative "View"

known_ingredients = Controller.list_known_ingredients
available_ingredients = Controller.list_available_ingredients#contains AvailableIngredient
cuisines = Controller.list_cuisines(known_ingredients, available_ingredients)

#show list of available ingredients - I should probably make it a class method
View.show_ai(available_ingredients)

high_priority = Controller.extract_ai(available_ingredients, 1)
midium_priority = Controller.extract_ai(available_ingredients, 3,2)
low_priority = Controller.extract_ai(available_ingredients, 7,4)
garbage = Controller.extract_ai(available_ingredients, -1,-999999)
View.show_ai(high_priority)
puts "===================================="
View.show_ai(midium_priority)
puts "===================================="
View.show_ai(low_priority)
puts "===================================="
puts "Throw away;"
View.show_ai(garbage)

=begin
things left to be worked on
using extracted lists of ai as keys, find cuisines
=end
