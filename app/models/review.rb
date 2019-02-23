class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates :user, :product, presence: true
  validates :description, presence: true, allow_blank: false
  validates :rating, length: { in: 1..5 }
  validates :rating,  presence: true
end
