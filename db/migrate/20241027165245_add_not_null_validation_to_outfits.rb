# frozen_string_literal: true

# Ensure that outfits have a name, enforced at db level
class AddNotNullValidationToOutfits < ActiveRecord::Migration[7.2]
  def change
    change_column_null :outfits, :name, false
  end
end
