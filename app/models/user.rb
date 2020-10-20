class User < ApplicationRecord
    has_many :properties, :foreign_key => 'host_id'
    has_many :stays, :through => :properties
    has_many :stays, :foreign_key => 'nomad_id'
    has_many :reviews, :foreign_key => 'nomad_id'
    # has_many :blogposts
    # has_many :comments, :through => :blogposts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


    def self.hosts
      User.all.where(host: true)
    end

    def self.nomads
      User.all.where(host: false)
    end

  end 
