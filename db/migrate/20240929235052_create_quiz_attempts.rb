class CreateQuizAttempts < ActiveRecord::Migration[7.2]
  def change
    create_table :quiz_attempts do |t|
      t.references :account, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.integer :score, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.datetime :started_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
