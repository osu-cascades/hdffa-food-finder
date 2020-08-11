class Provider < ApplicationRecord
  phony_normalize :phone, default_country_code: 'US'
  phony_normalized_method :fax_number
  validates :name, presence: true, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :phone, phony_plausible: true
  validates :url,
    format: { with: /\Ahttps?:\/\/([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?.*/,
    message: "must be an http or https URL"},
    allow_blank: true
end
