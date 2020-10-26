class User < ApplicationRecord
    has_many :reviews 
    has_many :reviewed_coffees, through: :reviews, source: :coffee 

    has_many :coffees 

    has_secure_password 

    validates :username, :email, presence: true 
    validates :username, uniqueness: true
end
