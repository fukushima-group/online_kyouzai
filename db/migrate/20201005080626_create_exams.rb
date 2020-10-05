class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.string :name,              null: false
      t.references :teacher, foreign_key: true
      t.timestamps
    end
  end
end
