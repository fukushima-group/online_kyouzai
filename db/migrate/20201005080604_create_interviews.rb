class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.text :content,              null: false
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
