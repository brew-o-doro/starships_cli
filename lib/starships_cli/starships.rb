# what do you want your object to look like?

class Starships

    @@all = []
    attr_accessor :name, :model, :manufacturer, :cost_in_credits

    def initialize( name, model, manufacturer, cost_in_credits)
        @name = name
        @model = model
        @manufacturer = manufacturer
        @cost_in_credits = cost_in_credits
        save
    end

    def save #saves all the ships upon initialization
        @@all << self
    end

    def self.all #returns all the ships
        @@all
    end

    # a method to make a query for starship info
    def self.find_starships(starship_name)
        self.all.find { |starship| starship.name == starship_name } 
    end

    

end