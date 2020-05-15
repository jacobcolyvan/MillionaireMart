class Design < ApplicationRecord
  belongs_to :user
  belongs_to :collection
  validates :title, :collection_id, presence: true
  has_one_attached :picture
end
