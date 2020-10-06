class Exam < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :unit_id
  end
  
  belongs_to :teacher
  has_many :tests
  has_one :record
end
