class Partner < ApplicationRecord
  has_and_belongs_to_many :categories
  phony_normalize :phone, default_country_code: 'US'
  has_one_attached :logo
  validates :name, presence: true, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, allow_blank: true
  validates :phone, phony_plausible: true
  validates :url,
    format: { with: /\Ahttps?:\/\/([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?.*/,
    message: "must be an http or https URL"},
    allow_blank: true

  def to_s
    name
  end
  
end
