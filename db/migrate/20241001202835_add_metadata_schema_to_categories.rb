class AddMetadataSchemaToCategories < ActiveRecord::Migration[7.2]
  def change
    add_column :categories, :metadata_schema, :jsonb, default: {}
  end
end
