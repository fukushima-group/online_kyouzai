class Exam < ApplicationRecord

  validates :name, presence: true
  
  belongs_to :teacher
  belongs_to :unit
  has_many :tests
  has_many :records
end
