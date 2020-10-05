class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.integer :math,              null: false
      t.integer :english,              null: false
      t.integer :society,              null: false
      t.integer :science,              null: false
      t.references :student, foreign_key: true
      t.references :exam, foreign_key: true
      t.timestamps
    end
  end
end
