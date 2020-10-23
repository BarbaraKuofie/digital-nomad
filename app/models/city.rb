class City < ApplicationRecord
    belongs_to :country
    has_many :properties

    def available_properties
        open_properties = []
        if self.city_stays.count > 0
            self.city_stays.each do |stay|
            if stay.checkout <= Date.today || (Date.today + 1.week) <= stay.checkin
                open_properties << stay.property
            end
            end
        end
         open_properties.flatten
    end

    def city_stays
        self.properties.map{|property|property.stays}.flatten
    end

end
