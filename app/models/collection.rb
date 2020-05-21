class Collection < ApplicationRecord
  belongs_to :user
  has_many :listings, dependent: :delete_all
  validates :title, presence: true
  has_one_attached :picture
  has_many :orders, :through => :listings, dependent: :destroy
end
