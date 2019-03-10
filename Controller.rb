class Controller
  require "date"
  require_relative "AvailableIngredient"
  require_relative "KnownIngredient"
  #require_relative "Recipe"
  class << self
    def list_available_ingredients
      #convert list of strings into AI, and put it in an array
      #skip if already created
      ai_list = Array.new
      file = File.open("assets/list_of_available_ingredients.txt")
      file.each_line do |line|
        temp = Array.new
        temp = line.chomp.split(/\s\s/) #fails when the file isn't formatted properly
        temp[1] = Date.strptime(temp[1], "%Y/%m/%d")
        ai_list << AvailableIngredient.new(temp[0], temp[1])
      end
      file.close
      #sort the list by days left
      ai_list.sort_by! do |i|
        i.days_left
      end
      return ai_list
    end

    def list_known_ingredients
      ki_list = Array.new
      file = File.open("assets/list_of_known_ingredients.txt")
      file.each_line do |line|
        temp = line.split(/\s\s/)
        temp[1] = temp[1].to_i
        ki_list << KnownIngredient.new(temp[0], temp[1])
      end
      file.close
      return ki_list
    end

    def list_recipes(known_ingredients_list)
      recipe_list = Array.new #contains all the recipes on the file
      required_ingredients = Array. new #temporarily holds the required ingredients
      if known_ingredients_list == nil #can recieve already available list as argument
        known_ingredients = self.list_known_ingredients #otherwise create anew
      else known_ingredients = known_ingredients_list
      end
      file = File.open("assets/list_of_recipes.txt") #list_of_recipes.txt
      cuisine = String.new #temporarily stores the name of the cuisine
      required_ingredients = Array.new #temporarily stores th required ingredients
      file.each_line do |line|
        #definitions abve resets them too often, resulting in
        #data not being saved to recipe_list
        if line =~ /^#/
          cuisine = line.delete("#") #temporarily holds the names of the cuisine
        elsif line =~ /^$/
          recipe_list << Recipe.new(cuisine, required_ingredients)
          cuisine = nil
          required_ingredients =Array.new
          #puts "END"
          #puts ""

          next
        else
          known_ingredients.each do |ki|###
            if line.chomp == ki.name
              #puts line.chomp
              required_ingredients << ki
            else
              #tests if it has missed (lengthofthearray) times
              #if true then puts "miss" for now.
              #later it shoud ask to add the ki.
              #(need the method to add things to assets)
            end#if
          end#if line
          #need to test this method
          #View.show_list(required_ingredients)
        end
      end
      return recipe_list
    end



    def ai_group(array, priority)
      #returns array of each group
      #it should just take days_left, as priority is redundant
      #but needs some functionarity to target a span of time
      group = Array.new
      array.each do |ai|
        if ai.priority == priority
          group << ai
        end
      end
      return group
    end
  end
end
