class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        errors = ''

        if user.tickets < attraction.tickets
            errors += " You do not have enough tickets to ride the #{attraction.name}."
        end

        if user.height < attraction.min_height
            errors += " You are not tall enough to ride the #{attraction.name}."
        end

        if errors == ""
            user.tickets -= attraction.tickets
            user.happiness += attraction.happiness_rating
            user.nausea += attraction.nausea_rating
            user.save
            "Thanks for riding the #{attraction.name}!"
        else
            "Sorry." + errors
        end
    end
end
