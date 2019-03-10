class View
  require_relative "Controller"
  class << self
    def show_list(array)
      puts array.length
      if array.length = 0
        puts "NONE"
      else
        array.each do |ai|
          puts "#{ai.name}" #should merge these two methods, using yield
        end
      end
    end
    def show_ai(available_ingredients)
      if available_ingredients.length == 0
        puts "NONE"
      else
        available_ingredients.each do |ai|
          puts "#{ai.days_left} days left for #{ai.name}"
        end
      end
    end #show_ai

    def show_required_ingredients_list(array)
      array.each do |cuisines|
        puts cuisines.name
        self.show_list(cuisines.required_ingredients)
        puts ""
      end
    end

  end#class << self
end
