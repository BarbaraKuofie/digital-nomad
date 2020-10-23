class Review < ApplicationRecord
    belongs_to :stay, optional: true
    belongs_to :nomad, :class_name => "User", optional: true

    validates :nomad_id, presence: true
    validates :description, presence: true
    validates :rating, presence: true
    validates :stay_id, presence: true

end
