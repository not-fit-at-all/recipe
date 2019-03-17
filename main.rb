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
available_ingredients = AvailableIngredient.list(known_ingredients)#contains AvailableIngredient
cuisines = Cuisine.list(known_ingredients, available_ingredients)

View.show_ai(available_ingredients)
cuisines.each do |cuisine|
  if cuisine.missing_ingredients == nil
    puts "  #{cuisine.name} can be cooked"
  else
    puts "   #{cuisine.name} is missing;"
    cuisine.missing_ingredients.each do|mi|
      puts "    #{mi.name}"
    end

  end
end


=begin
high_priority = AvailableIngredient.extract(available_ingredients, 1)
#View.show_ai(high_priority)
puts "===================================="
midium_priority = AvailableIngredient.extract(available_ingredients, 3,2)
#View.show_ai(midium_priority)
puts "===================================="
low_priority = AvailableIngredient.extract(available_ingredients, 7,4)
#View.show_ai(low_priority)
puts "===================================="
#garbage = AvailableIngredient.extract(available_ingredients, -1,-999999)
puts "Throw away;"
View.show_ai(garbage)
=end

=begin
things left to be worked on
using extracted lists of ai as keys, find cuisines
=end
