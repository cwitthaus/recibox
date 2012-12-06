class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :source
      t.integer :uploaded_user

      t.timestamps
    end
    add_index :recipes, [:uploaded_user, :title]
  end
end
