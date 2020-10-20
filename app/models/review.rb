class Review < ApplicationRecord
    belongs_to :stay
    belongs_to :nomad, :class_name => "User"
end
