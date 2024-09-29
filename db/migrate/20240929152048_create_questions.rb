class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :name, null: false
      t.text :content
      t.references :creator, foreign_key: { to_table: :accounts }, null: false

      t.timestamps
    end
  end
end
