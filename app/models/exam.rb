class Exam < ApplicationRecord
  belongs_to :teacher
  has_many :subjects
end
