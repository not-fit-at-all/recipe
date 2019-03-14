class Controller
  require "date"
  require_relative "../Models/AvailableIngredient"
  require_relative "../Models/KnownIngredient"
  #require_relative "cuisine"
  class << self


    def list_cuisines(known_ingredients = KnownIngredients.list, ai)
      puts "Controller.list_cuisines"
      cuisines_list = Array.new #contains all the cuisines on the file
      required_ingredients = Array. new #temporarily holds the required ingredients
      #if known_ingredients_list == nil #can recieve already available list as argument
      #  known_ingredients = self.list_known_ingredients #otherwise create anew
      #else known_ingredients = known_ingredients_list
      #end
      length = known_ingredients.length
      puts "  the number of known ingredients = #{length}"
      file = File.open("assets/list_of_cuisines.txt") #list_of_cuisines.txt
      cuisine_name = String.new #temporarily stores the name of the cuisine
      required_ingredients = Array.new #temporarily stores th required ingredients
      file.each_line do |line|
        if line =~ /^#/ #cuisine's name
          cuisine = line.delete("#") #temporarily holds the names of the cuisine
        elsif line =~ /^$/ #end of the required ingredients
          cuisines_list << Cuisine.new(cuisine, required_ingredients, ai)
          cuisine = nil
          required_ingredients =Array.new
          #puts "END"
          #puts ""
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
              end
            end#if
          end#if line
          #need to test this method
          #View.show_list(required_ingredients)
        end
      end
      return cuisines_list
    end



  end #class << self
end
