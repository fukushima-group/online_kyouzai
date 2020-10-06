class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.string     :name,       null: false
      t.integr     :unit_id,    null: false
      t.references :student,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
