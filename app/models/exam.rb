class Exam < ApplicationRecord
  belongs_to :teacher
  has_many :tests
  has_one :record
end
