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
end
