
class AvailableIngredient
  require "date"
  require_relative "KnownIngredient"
  #contains the data of each of the available ingredients in stock
  #why am I not using hash object instead?
  attr_reader :name
  attr_reader :expiration
  attr_reader :days_left
  attr_reader :quantity
  def initialize(name, date_of_purchase)
    puts "AvailableIngredient.initialize  (#{name})"
    #should take expiration date if available
    @name = name
    @date_of_purchase = date_of_purchase
    @expiration = self.get_expiration
    @days_left = (@expiration - Date.today).to_i
    @quantity = 1 #placeholder. should be fetched from the list
  end
  def get_expiration
    puts " AvailableIngredient.get_expiration"
    i = 0
    kil = Controller.list_known_ingredients#this should not be happening
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
      #this dialogue should add the ingredient to the list and the file,
      #instead of just proceeding like this
    end
  end
end
