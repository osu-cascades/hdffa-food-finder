class Value < ApplicationRecord
    has_and_belongs_to_many :partners
    validates :name, presence: true, uniqueness: true
  
    def to_s
      name
    end
end
