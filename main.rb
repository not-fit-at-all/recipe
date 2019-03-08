#open the file
#define AvailableIngredients
#convert the file into AvailableIngredient
require "date"
require_relative "KnownIngredient"
require_relative "AvailableIngredient"
require_relative "Recipe"
require_relative "Controller"
require_relative "View"

known_ingredients = Controller.list_known_ingredients
available_ingredients = Controller.list_available_ingredients#contains AvailableIngredient

#show list of available ingredients - I should probably make it a class method
available_ingredients.each do |ai|
  puts "#{ai.days_left} days left for #{ai.name}"
end

puts "===================================="
Controller.ai_group(available_ingredients, 1).each do |ai|
  puts "#{ai.days_left} days left for #{ai.name}"
end
puts "===================================="
Controller.ai_group(available_ingredients, 2).each do |ai|
  puts "#{ai.days_left} days left for #{ai.name}"
end
puts "===================================="
Controller.ai_group(available_ingredients, 3).each do |ai|
  puts "#{ai.days_left} days left for #{ai.name}"
end
puts "===================================="
Controller.ai_group(available_ingredients, 4).each do |ai|
  puts "#{ai.days_left} days left for #{ai.name}"
end

=begin
things left to be worked on
create methods to get put priority marks on each AI
create methods to show AIs of each priority
=end
