require_relative "Controller"
class View
  class << self
    def show_list(array)
      array.each do |ai|
        puts "#{ai.name}"
      end
    end

    def show_required_ingredients_list(array)
      array.each do |cuisines|
        puts cuisines.name
        self.show_list(cuisines.required_ingredients)
        puts ""
      end
    end
  end
end
