class AbstractIngredient
  require AvailableIngredient

  def initialize
    attr_reader :name
    def initialize(name, shelf_life)
      @name = name
      @shelf_life = shelf_life
    end


    class << self
        def list_abstract(file_name = "assets/list_of_known_ingredients.txt")
          puts "Ingredient.list_abstract"
          ki_list = Array.new
          file = File.open(file_name)
          file.each_line do |line|
            temp = line.split(/\s\s/)
            temp[1] = temp[1].to_i
            ki_list << KnownIngredient.new(temp[0], temp[1])
          end
          file.close
          return ki_list
        end
      end
  end
end
