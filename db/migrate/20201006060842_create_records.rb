class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.integer    :score,      null: false
      t.references :exam,       null: false, foreign_key: true
      t.references :student,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
