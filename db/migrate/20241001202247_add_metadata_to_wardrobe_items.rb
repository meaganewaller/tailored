class AddMetadataToWardrobeItems < ActiveRecord::Migration[7.2]
  def change
    add_column :wardrobe_items, :metadata, :jsonb, default: {}
    add_index :wardrobe_items, :metadata, using: :gin
  end
end
