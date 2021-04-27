class FeaturedListing < ApplicationRecord
    has_many :partners
    validates :name, presence: true, uniqueness: true

    def to_s
        name
    end
end
