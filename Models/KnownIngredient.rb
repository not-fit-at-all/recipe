class KnownIngredient
  #contains each of known ingredients
  #Must eventurally add prices in each seasons, nutrients etc
  #@name is the name of the ingredient
  #@shelf_life is how long the ingredient typically lasts after purchase
  attr_reader :name
  attr_reader :shelf_life
  def initialize(name, shelf_life)
    @name = name
    @shelf_life = shelf_life
  end

  class << self
      def list(file_name = "assets/list_of_known_ingredients.txt")
        puts "KnownIngredient.list"
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
