class Vehicle < ApplicationRecord
  has_many :locations
  validates :id, presence: true
end
