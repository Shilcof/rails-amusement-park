module AttractionsHelper
    def attraction_link(attraction)
        prefix = current_user.admin ? "Show" : "Go on"
        "#{prefix} #{attraction.name}"
    end

    def attraction_showpage_link(attraction)
        if current_user.admin
            link_to 'Edit Attraction', edit_attraction_path(attraction)
        else
            # ride = Ride.new
            # form_for ride do |f|
            #     f.hidden_field :user_id, value: current_user.id
            #     f.hidden_field :attraction_id, value: attraction.id
            #     f.submit 'Go on this ride'
            # end
        end
    end
end
