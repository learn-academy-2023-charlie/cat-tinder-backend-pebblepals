class Rock < ApplicationRecord
    validates :name, :age, :image, presence: true 
    validates :enjoys, length: {minimum: 10}  
end
