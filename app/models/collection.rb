class Collection < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :design
  validates :title, presence: true
  has_one_attached :picture
end
