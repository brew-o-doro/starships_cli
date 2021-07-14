# responsible communication between user and data

class CLI
    # an entryway method
    def start #called upon instantiating cli
        puts "booting...booting..." 
        API.fetch_data
        puts "Welcome to the Starship Lot, shopping for a new starship?"
        puts "Let's start with your name:"
        greet(user_input)

    end

    def user_input #grabs user input 
        gets.strip
    end

    def greet(name)
        puts "awesome #{name}, would you like to see our starships?"
        puts "Input 'y' to see the list, 'exit' to leave the lot!"
        menu
    end

    #based on user selection we will either show a list of starships
    def starships_list #gets
        Starship.all.each.with_index(1) do |starship, i| 
            puts "#{i}. #{starship.name}"
        end
        starship_selection
    end 
 
    def goodbye #
        puts "May the Force Be With You"
    end

    def invalid 
        puts "Does not compute...error error"

        menu
    end

    def starship_selection 
        puts ""
        puts "Select a starship for more detail"

        selection = user_input

        starship = Starship.find_starships(selection)
        # query starship class to find details
        starship_details(starship)
    end

    def starship_details(starship) #
        puts ""
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Name: #{starship.name}"
        puts "Model: #{starship.model}"
        puts "Manufacturer: #{starship.manufacturer}"
        puts "Cost In Credits: #{starship.cost_in_credits}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        menu 
    end

    def menu 
        selection = user_input
       
        # case selection
        #     when selection == 'y'
        #         # print the starship list and
        #     when selection == 'exit'
        #     else puts "invalid"
        # end
        if selection == 'y'
            starships_list
            menu
        elsif selection == 'exit'
            goodbye
        else 
            invalid
        end
    end

end