class Interview < ApplicationRecord

  validates :content, presence: true

  belongs_to :student
end
