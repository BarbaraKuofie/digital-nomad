class Property < ApplicationRecord
    belongs_to :city
    belongs_to :host, :class_name => "User"
    has_many :stays
    has_many :reviews, :through => :stays
    has_many :nomads, :class_name => "User", :through => :stays


    def average_rating 
       total_ratings = self.reviews.map{|review|review.rating}.sum 
        total_reviews = self.reviews.count  
        (total_ratings.to_f/total_reviews.to_f).round(2)
    end 
    
end
