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
cuisines = Controller.list_cuisines(known_ingredients, available_ingredients)

#show list of available ingredients - I should probably make it a class method
View.show_ai(available_ingredients)

high_priority = AvailableIngredient.extract(available_ingredients, 1)
midium_priority = AvailableIngredient.extract(available_ingredients, 3,2)
low_priority = AvailableIngredient.extract(available_ingredients, 7,4)
garbage = AvailableIngredient.extract(available_ingredients, -1,-999999)
View.show_ai(high_priority)
puts "===================================="
View.show_ai(midium_priority)
puts "===================================="
View.show_ai(low_priority)
puts "===================================="
puts "Throw away;"
View.show_ai(garbage)

test = cuisines[0].missing_ingredients
test.each do |i|
  puts i.name
end

=begin
things left to be worked on
using extracted lists of ai as keys, find cuisines
=end
