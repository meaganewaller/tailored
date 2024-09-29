class CreateQuizzes < ActiveRecord::Migration[7.2]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false
      t.text :description
      t.references :creator, foreign_key: { to_table: :accounts }, null: false


      t.timestamps
    end
  end
end
