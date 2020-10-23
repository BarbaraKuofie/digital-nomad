class User < ApplicationRecord
    has_many :properties, :foreign_key => 'host_id'
    has_many :stays, :through => :properties
    has_many :stays, :foreign_key => 'nomad_id'
    has_many :reviews, :foreign_key => 'nomad_id'
    has_one_attached :avatar

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
      Stay.all.where("nomad_id = ? AND checkin >= ?", self, Date.today)
    end

    #   if self.stays.count > 0
    #     pending =  self.stays
    #         .order(checkin: :desc)
    #         .where.not(checkin: nil)
    #         .select { |stay| stay.checkin >= (Date.today) }
    #     pending_titles = pending.map{|stay|stay.property.title}
    #   else
    #     pending_titles = []
    #   end
    #   pending_titles
    # end

    # this is to show users previous trips
    def nomad_completed_stays
      Stay.all.where("nomad_id = ? AND checkout < ?", self, Date.today)
    end

    #   if self.stays.count > 0
    #     completed =  self.stays
    #       .order(checkout: :desc)
    #       .where.not(checkout: nil)
    #       .select { |stay| stay.checkout < (Date.today) }
    #     completed_titles = completed.map{|stay|stay.property.title}
    #   else
    #     completed_titles = []
    #   end
    #   completed_titles
    # end


    def host_stays
      Stay.select{|stay| stay.property.host == self}
    end


    def host_upcoming_stays
      if self.host_stays.count > 0
        pending =  self.host_stays
         .select { |stay| stay.checkin >= (Date.today) }
        pending_titles = pending.map{|stay|stay.property.title}
      else
        pending_titles = []
      end
      pending_titles
    end

        #  .order(checkin: :assc)
        #  .where.not(checkin: nil)


  end
