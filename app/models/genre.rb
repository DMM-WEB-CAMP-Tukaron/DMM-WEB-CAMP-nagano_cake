class Genre < ApplicationRecord
    
    has_many :items, dependent: :destroy
    
    validates :genre, presence: true, uniqueness: true
    
end
