class Exam < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :unit_id
  end
  
  belongs_to :teacher
  belongs_to :unit
  has_many :tests
  has_one :record
end
