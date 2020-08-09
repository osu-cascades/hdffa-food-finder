class Provider < ApplicationRecord
  phony_normalize :phone, default_country_code: 'US'
  phony_normalized_method :fax_number
  validates :name, presence: true, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :phone, phony_plausible: true
end
