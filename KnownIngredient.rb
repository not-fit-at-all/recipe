class KnownIngredient
  #contains each of known ingredients
  #Must eventurally add prices in each seasons, nutrients etc
  #@name is the name of the ingredient
  #@shelf_life is how long the ingredient typically lasts after purchase
  attr_reader :name
  attr_reader :shelf_life
  def initialize(name, shelf_life)
    @name = name
    @shelf_life = shelf_life
  end

end
