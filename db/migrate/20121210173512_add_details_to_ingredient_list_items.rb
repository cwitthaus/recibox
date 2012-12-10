class AddDetailsToIngredientListItems < ActiveRecord::Migration
  def change
    add_column :ingredient_list_items, :details, :string
  end
end
