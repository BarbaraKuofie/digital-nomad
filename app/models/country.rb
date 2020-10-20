class Country < ApplicationRecord
    has_many :cities
    has_many :properties, :through => :cities
end
