class AvailableIngredient
  require "date"
  require_relative "KnownIngredient"
  #contains the data of each of the available ingredients in stock
  #why am I not using hash object instead?
  attr_reader :name
  attr_reader :expiration
  attr_reader :days_left
  attr_reader :quantity
  attr_reader :priority

  def initialize(name, date_of_purchase, known_ingredients)
    #should take expiration date if available
    @name = name
    @date_of_purchase = date_of_purchase
    @expiration = self.get_expiration(known_ingredients)
    @days_left = (@expiration - Date.today).to_i
    @priority = self.get_priority
    @quantity = 1 #placeholder. should be fetched from the list
  end

  def get_expiration(known_ingredients = KnownIngredinet.list)
    i = 0
    known_ingredients.each do |ki|
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

  def get_priority
    puts "#{self.name}.get_priority"
      if self.days_left >= 0
          priority = 0
        else
          priority = (1 / self.days_left) ** 2
        end
    return priority
  end

  class << self
    def list(known_ingredients, file_name = "assets/list_of_available_ingredients.txt")
      puts "AvailableIngredient.list"
      #convert list of strings into AI, and put it in an array
      #skip if already created
      ai_list = Array.new
      file = File.open(file_name)
      file.each_line do |line|
        ai = Array.new
        ai = line.chomp.split(/\s\s/) #fails when the file isn't formatted properly
        ai[1] = Date.strptime(ai[1], "%Y/%m/%d")
        ai_list << self.new(ai[0], ai[1], known_ingredients)
      end
      file.close
      #sort the list by days left
      ai_list.sort_by! do |i|
        i.days_left
      end
      return ai_list
    end

    def extract(array, max = 9999999, min = 0)
      puts "AvailableIngredient.extract (#{min} - #{max})"
      #returns array of each group
      #it should just take days_left, as priority is redundant
      #but needs some functionarity to target a span of time
      extract = Array.new
      array.each do |ai|
        puts "  #{ai.name}, #{ai.days_left}"
        if ai.days_left <= max and ai.days_left > min
          extract << ai
        end
      end
      return extract
    end #def extract_ai
  end
end
