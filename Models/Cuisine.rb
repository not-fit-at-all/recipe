class Cuisine
  require_relative "KnownIngredient"
  require_relative "AvailableIngredient"
  #look for the recipes that use ingredints of each priority group
  #and return them as an array, sorted by the number of high prio ingredients they consume
  #it knows if it can be cooked with the ingredients available,
  #and what needs to be bought if not.
  attr_reader :name
  attr_reader :required_ingredients
  attr_reader :missing_ingredients
  def initialize(name, required_ingredients, available_ingredients)
    @name = name #The name of the cuisine
    @required_ingredients = required_ingredients #Contains an array of KnownIngredient
    #quantity?
    @missing_ingredients = self.list_missing_ingredients(available_ingredients)
  end

  def ready_to_cook?
    if @missing_ingredients == nil
      return true
    else
      return self.missing_ingredients
    end
  end

  def list_missing_ingredients(available_ingredients)
    puts "#{self.name}.list_missing_ingredients"
    @missing_ingredients = Array.new
    number_of_ai = available_ingredients.length
    @required_ingredients.each do |ri|
      quantity = 0
      miss = 0
      available_ingredients.each do |ai|
        if ri.name == ai.name
          quantity += ai.quantity
        end
      end#ai
      if quantity == 0 #placeholder. should compared to required quantity,saved in cuisine list
        @missing_ingredients << ri
      end
    end#ri
    return @missing_ingredients
  end


  class << self
    def list(known_ingredients = KnownIngredient.list, ai)
      puts "Cuisine.list"
      cuisines_list = []
      file = File.open("assets/list_of_cuisines.txt")
      cuisine_name = ""
      required_ingredients = [] #temporarily stores th required ingredients
      length = known_ingredients.length
      #puts "  the number of known ingredients = #{length}"
      file.each_line do |line|
        if line =~ /^#/ #cuisine's name
          cuisine_name = line.chomp.delete("#") #temporarily holds the names of the cuisine
        elsif line =~ /^$/ #end of the required ingredients
          cuisines_list << Cuisine.new(cuisine_name, required_ingredients, ai)
          cuisine = nil
          required_ingredients =Array.new
          next
        else
          missed = 0
          known_ingredients.each do |ki|
            if line.chomp == ki.name
              required_ingredients << ki
            else
              missed += 1
              if missed == length
                puts "  can't find #{line.chomp}"
                #later it shoud ask to add the ki.
                #(need the method to add things to assets)
              end #missed
            end #each ki
          end #if
        end#if line
      end #each line
      return cuisines_list
    end #list
  end #class << self
end #class

=begin
to find missing ingredients, for each required_ingredients I need to
look up on an array that is the product of Controller.list_available_ingredients
and see if there is a sufficient quantity of such ingredient.
=end
