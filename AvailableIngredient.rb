require "date"
require_relative "KnownIngredient"

class AvailableIngredient
  #contains the data of each of the available ingredients in stock
  #why am I not using hash object instead?
  attr_reader :name
  attr_reader :expiration
  attr_reader :days_left
  attr_reader :priority
  def initialize(name, date_of_purchase)
    #should take expiration date if available
    @name = name
    @date_of_purchase = date_of_purchase
    @expiration = self.get_expiration
    @days_left = (@expiration - Date.today).to_i

    case @days_left
    when (0..1)
      @priority = 1
    when (2..3)
      @priority = 2
    when (4..7)
      @priority = 3
    else
      @priority = 4
    end

  end
  def get_expiration
    i = 0
    kil = Controller.list_known_ingredients
    kil.each do |ki|
      if ki.name == @name
        return @date_of_purchase + ki.shelf_life
        i += 1
        break
      end
    end
    if i == 0
      puts "unknown ingredient: #{@name}"
      puts "How many days does it last after purchase? : "
      return @date_of_purchase + gets.chomp.to_i
      #dis dialogue should add the ingredient to the list and the file,
      #instead of just proceeding like this
    end
  end
end
