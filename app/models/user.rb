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
    def nomad_upcoming_stays
     pending =  self.stays
        .order(checkin: :desc)
        .where.not(checkin: nil)
        .select { |stay| stay.checkin > (Date.today) }
     pending_titles = pending.map{|stay|stay.property.title}
      if pending_titles.count > 0
        pending_titles
      else
        "You have no scheduled stays. Click below to schedule one!"
      end
    end

    # this is to show users previous trips
    def nomad_completed_stays
      completed =  self.stays
         .order(checkout: :desc)
         .where.not(checkout: nil)
         .select { |stay| stay.checkout < (Date.today) }
      completed_titles = completed.map{|stay|stay.property.title}
        if completed_titles.count > 0
          completed_titles
        else
          "You have no past stays"
        end
    end

    def host_stays
      Stay.select{|stay| stay.property.host == self}
    end


    def host_upcoming_stays
      if self.host_stays.count > 0
        pending =  self.host_stays
         .order(checkin: :assc)
         .where.not(checkin: nil)
         .select { |stay| stay.checkin > (Date.today) }
        pending_titles = pending.map{|stay|stay.property.title}
        pending_titles
      else
        "You have no scheduled stays. Click below to schedule one!"
      end
    end




  end
