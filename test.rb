require "date"
require_relative "KnownIngredient"
require_relative "AvailableIngredient"
require_relative "Recipe"
require_relative "Controller"
require_relative "View"

=begin
wday = {sunday:"A", monday:"B"}

wday.each do |key, value|
  p key
  p wday[key]
end

array = []
str = "blue 青 white 白\nred 赤"
array = str.split(/\s/)
p array
#testest
=end

test = Controller.list_recipes(nil)
View.show_required_ingredients_list(test)


=begin
thoguts

maybe I should just have an Ingredient class,
instead of having AvailanbleIngredient and
KnownIngredient. or at least, they should be
subclass of Ingredient class.


nanki/text_layout
aptinio/text-table



=end
