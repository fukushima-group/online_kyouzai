class Test < ApplicationRecord

  with_options presence: true do
    validates :question
    validates :answer
  end

  belongs_to :exam
end
