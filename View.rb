require_relative "Controller"
class View
  class << self
    def show_list(array)
      array.each do |ai|
        puts "#{ai.name}"
      end
    end
  end
end
