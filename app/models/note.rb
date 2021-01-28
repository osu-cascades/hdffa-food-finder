class Note < ApplicationRecord
  default_scope {order('created_at DESC')}

	belongs_to :partner
	belongs_to :user

  validates :title, presence: true, allow_blank: false
  validates :body, presence: true, allow_blank: false

end
