class City < ApplicationRecord
    belongs_to :country
    has_many :properties

    def available_properties (start_date, end_date)
        if self.city_stays.count > 0
            open_properties = []
        self.city_stays.each do |stay|
            if stay.checkout <= start_date.to_date || end_date.to_date <= stay.checkin
                open_properties << stay.property
            end 
        end
        end
         open_properties
    end 

    def city_stays 
        self.properties.map{|property|property.stays}.flatten 
    end 

end
