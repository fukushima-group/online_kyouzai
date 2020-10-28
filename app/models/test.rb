class Test < ApplicationRecord

  with_options presence: true do
    validates :question
    validates :answer
  end

  belongs_to :exam
  has_many_attached :images
  validates :images, length: { minimum: 0, maximum: 5, message: "は5枚以下にしてください" }
end
