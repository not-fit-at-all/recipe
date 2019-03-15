class View
  require_relative "../Controllers/Controller"
  class << self
    def show_list(array) #broken
      puts "View.show_list"
      puts array.length
      if array.length == 0
        puts "NONE"
      else
        array.each do |ai|
          puts "#{ai.name}" #should merge these two methods, using yield
        end
      end
    end

    def show_ai(available_ingredients)
      puts "View.show_ai"
      if available_ingredients.length == 0
        puts "NONE"
      else
        available_ingredients.each do |ai|
          puts "  #{ai.days_left} days left for #{ai.name}"
        end
      end
    end #show_ai

    def show_required_ingredients_list(array)
      puts "View.show_required_ingredients_list"
      array.each do |cuisines|
        puts cuisines.name
        self.show_list(cuisines.required_ingredients)
        puts ""
      end
    end

    def show_cuisines(cuisines)
      cuisines.each do |cuisine|
        puts "#{cuisine.name}================="
        cuisine.missing_ingredients.each do |mi|
          puts "  #{mi.name}"
        end
      end
    end

  end#class << self
end
