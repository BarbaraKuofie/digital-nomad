class User < ApplicationRecord
    has_many :properties, :foreign_key => 'host_id'
    has_many :stays, :through => :properties
    has_many :stays, :foreign_key => 'nomad_id'
    has_many :reviews, :foreign_key => 'nomad_id'
    # has_many :blogposts
    # has_many :comments, :through => :blogposts

    
end
