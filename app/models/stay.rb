class Stay < ApplicationRecord
    belongs_to :property
    belongs_to :nomad, :class_name => "User"
    has_one :review
end
