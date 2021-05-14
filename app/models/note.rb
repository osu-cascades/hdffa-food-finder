class Note < ApplicationRecord
  default_scope {order('created_at DESC')}
  scope :past_n_days, ->(days) { where("created_at >= ?" , days.days.ago) }

	belongs_to :partner
	belongs_to :user

  has_many_attached :images

  validates :title, presence: true, allow_blank: false
  validates :body, presence: true, allow_blank: false

end
