class Collection < ApplicationRecord
  belongs_to :user
  has_many :designs, dependent: :delete_all
  validates :title, presence: true
  has_one_attached :picture
end
