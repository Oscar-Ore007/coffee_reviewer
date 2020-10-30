class User < ApplicationRecord
    has_many :reviews 
    has_many :reviewed_coffees, through: :reviews, source: :coffee 

    has_many :coffees 

    has_secure_password 

    validates :username, :email, presence: true 
    validates :username, uniqueness: true

    def self.from_omniauth(auth)
    #there are many 
    where(email: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end

end
