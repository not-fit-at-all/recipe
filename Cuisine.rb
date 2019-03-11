class Cuisine
  require_relative "KnownIngredient"
  require_relative "AvailableIngredient"
  #look for the recipes that use ingredints of each priority group
  #and return them as an array, sorted by the number of high prio ingredients they consume
  #it knows if it can be cooked with the ingredients available,
  #and what needs to be bought if not.
  attr_reader :name
  attr_reader :required_ingredients
  def initialize(name, required_ingredients, available_ingredients)
    @name = name #The name of the cuisine
    @required_ingredients = required_ingredients #Contains an array of KnownIngredient
    #quantity?


  end

  def list_missing_ingredients
    =begin
    to find missing ingredients, for each required_ingredients I need to
    look up on an array that is the product of Controller.list_available_ingredients
    and see if there is a sufficient quantity of such ingredient.
    =end
    @missing_ingredients = Array.new
    number_of_ai = available_ingredients.length
    @required_ingredients.each do |ri|
      quantity = 0
      miss = 0
      available_ingredients.each do |ai|
        if @name == ai.name
          quantity += ai.quantity
        end
      end#ai
      if quantity == 0 #placeholder. should compared to required quantity,saved in cuisine list
        @missing_ingredients << ri
      end
    end#ri
  end
end
