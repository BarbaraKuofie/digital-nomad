class Property < ApplicationRecord
    belongs_to :city
    belongs_to :host, :class_name => "User"
    has_many :stays
    has_many :reviews, :through => :stays
    has_many :nomads, :class_name => "User", :through => :stays


    
end
