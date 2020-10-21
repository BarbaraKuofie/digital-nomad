class City < ApplicationRecord
    belongs_to :country
    has_many :properties

    def available_properties (start_date, end_date)
        available_properties = []
        self.properties.each do |property|
            available = true 
            property.stays.each do |stay|
            if stay.checkout <= start_date.to_date || end_date.to_date <= stay.checkin
            else 
                available = false 
            end 
            end 
            if available
                available_properties << property
            end 
             available_properties
        end  
    end 

end
