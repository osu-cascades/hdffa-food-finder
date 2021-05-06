class Note < ApplicationRecord
  include Filterable
  default_scope {order('created_at DESC')}

	belongs_to :partner
	belongs_to :user

  has_many_attached :images

  validates :title, presence: true, allow_blank: false
  validates :body, presence: true, allow_blank: false

end
