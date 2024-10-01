class AddCitextExtension < ActiveRecord::Migration[7.2]
  def change
    enable_extension :citext
    change_column :categories, :name, :citext
  end
end
