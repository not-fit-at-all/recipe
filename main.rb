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
available_ingredients = AvailableIngredient.list(known_ingredients)
ai = AvailableIngredient.extract(available_ingredients)
cuisines = Cuisine.list(known_ingredients, ai)
high_priority = AvailableIngredient.extract(ai, 3, 0)

puts '========================'
puts 'p ai'
puts ai
puts ai.length

View.show_ai(high_priority)
View.show_ai(ai)
puts '========================'
cuisines.each do |cuisine|
  if cuisine.missing_ingredients.empty?
    puts "  ingredients for #{cuisine.name} are available"
  else
    puts "  #{cuisine.name} is missing;"
    cuisine.missing_ingredients.each do|mi|
      puts "    #{mi.name}"
    end
  end
end


high_priority = AvailableIngredient.extract(available_ingredients, 3)
View.show_ai(high_priority)

cuisines.each do |c|
  puts c.name
  c.check_readyness(high_priority)
end
=begin
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
