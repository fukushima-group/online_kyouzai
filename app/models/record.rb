class Record < ApplicationRecord
  belongs_to :student
  belongs_to :exam
end
