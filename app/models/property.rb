class Property < ApplicationRecord
    belongs_to :city
    belongs_to :host, :class_name => "User"
    has_many :stays
    has_many :reviews, :through => :stays
    has_many :nomads, :class_name => "User", :through => :stays
    has_one_attached :image


    def average_rating
       total_ratings = self.reviews.map{|review|review.rating}.sum
        total_reviews = self.reviews.count
        (total_ratings.to_f/total_reviews.to_f).round(2)
    end

    def formatted_name
        "#{title} in #{self.city.name}, #{self.city.country.name}"
    end

    def current_nomads
        if self.stays.count > 0
           early_checkin = self.stays.select{|stay|stay.checkin<= Date.today}
           late_checkout = self.stays.select{|stay|stay.checkout> Date.today}
           staying = early_checkin & late_checkout
        else
            staying = []
        end 
        staying
    end 

end
