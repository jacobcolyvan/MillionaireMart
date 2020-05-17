class ShoppingCart < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :design
  # has_and_belongs_to_many :designs
end
