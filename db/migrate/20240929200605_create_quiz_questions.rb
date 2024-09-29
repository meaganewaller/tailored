class CreateQuizQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :quiz_questions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.integer :display_order, default: 0
      t.boolean :shuffleable, default: false
      t.boolean :required, default: true

      t.timestamps
    end
  end
end
