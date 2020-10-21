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

    ## method shows all upcoming user trips 
    def pending_trips
      # if current_password     
      if self.stays 
      upcoming_stays = self.stays.select{|stay|stay.checkin > Date.today}
      upcoming_stays_title = upcoming_stays.map{|stay|stay.property.title}
      upcoming_stays_title 
      else  
      "No stays scheduled, click on the below link to plan stays."
      end 
    end 

    # this is to show users previous trips 
    def completed_trips 
      if self.stays 
        completed_stays = self.stays.select{|stay|stay.checkin < Date.today}
        completed_stays_title = completed_stays.map{|stay|stay.property.title}
        completed_stays_title
      else 
          "You have no past stays"
      end 
    end 


  end 
