class Stay < ApplicationRecord


    belongs_to :property
    belongs_to :nomad, :class_name => "User"
    has_one :review

    def self.top_5
        all_stays = self.all
        stay_cities = all_stays.map {|stay| stay.property.city.name}
        freq = stay_cities.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
        sorted = freq.sort_by {|k,v| v}.reverse.to_h
        sorted.keys[0..4]
    end

    ## method to select a country from a picklist on new stay create page 
    def stay_country
    end 
    ## method to select a city based on the above country (not yet working properly)
    def stay_city 
        # cities = Country.all.map{|country|country.cities}
        # cities.map{|city|city.name}
    end 
end
