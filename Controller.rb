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

    def list_recipes
      recipe_list = Array.new #contains all the recipes on the file
      required_ingredients = Array. new #temporarily holds the required ingredients
      known_ingredients = self.list_known_ingredients
      file = File.open("assets/list_of_recipes.txt") #list_of_recipes.txt
      file.each_line do |line|
        if line =~ /^#/
          puts line
          cuisine = line.delete("#") #temporarily holds the names of the cuisine
          puts "!#{cuisine}"
        elsif line =~ /^$/
          puts "END"
          puts cuisine
          puts required_ingredients
          recipe_list << Recipe.new(cuisine, required_ingredients)
          cuisine = nil
          required_ingredients = nil

          next
        else
          puts line
          known_ingredients.each do |ki|
            if line == ki.name
              required_ingredients << ki
            end
          end
          #need to test this method
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
