class Rock < ApplicationRecord
    validates :name, :age, :enjoys, length: {minimum: 10} 
    validates :image, presence: true
end
