class Note < ApplicationRecord
    belongs_to_many :partners
    has_and_belongs_to_many :users
    validates :name, presence: true, uniqueness: true
    attr_accessible :content 
  
    def to_s
      name
    end
    
  end