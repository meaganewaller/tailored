class CreateQuestionOptions < ActiveRecord::Migration[7.2]
  def change
    create_table :question_options do |t|
      t.references :question, null: false, foreign_key: true
      t.string :optionable_type # Polymorphic association
      t.integer :optionable_id   # Polymorphic association ID
      t.integer :score, default: 0
      t.integer :display_order, default: 0

      t.timestamps
    end

    add_index :question_options, [:optionable_type, :optionable_id]
  end
end
