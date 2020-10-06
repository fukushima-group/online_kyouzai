class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.text       :question,   null: false
      t.text       :answer,     null: false
      t.references :student,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
