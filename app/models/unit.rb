class Unit < ApplicationRecord
  has_ancestry

  validates :name, presence: true

  has_many :items
end
