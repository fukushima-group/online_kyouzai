class Unit < ApplicationRecord
  validates :name, presence: true

  has_many :exams
  has_ancestry

  def self.unit_parent_array_create
    unit_parent_array = ['---']
    Unit.where(ancestry: nil).each do |parent|
      unit_parent_array << [parent.name, parent.id]
    end
    return unit_parent_array
  end
end
