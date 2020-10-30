class Brand < ApplicationRecord
        has_many :coffees
        validates :name, presence: true, uniqueness: true 

        scope :alpha, -> { order(:name) }
    
end 