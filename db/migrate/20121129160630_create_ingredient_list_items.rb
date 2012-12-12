class CreateIngredientListItems < ActiveRecord::Migration
  def change
    create_table :ingredient_list_items do |t|
      t.integer :recipe_id
      t.float :measurement_amount
      t.string :measurement_unit
      t.integer :ingredient_id
    end
    add_index :ingredient_list_items, [:recipe_id, :ingredient_id]
  end
end
