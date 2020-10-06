class Record < ApplicationRecord

  validates :score, presence: true

  belongs_to :student
  belongs_to :exam
end
