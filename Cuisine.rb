class Cuisine
  require_relative "KnownIngredient"
  #look for the recipes that use ingredints of each priority group
  #and return them as an array, sorted by the number of high prio ingredients they consume
  attr_reader :name
  attr_reader :required_ingredients
  def initialize(name, required_ingredients)
    @name = name #The name of the cuisine
    @required_ingredients = required_ingredients #Contains an array of KnownIngredient
    #quantity?
  end
end
