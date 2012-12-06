class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :instructions
      t.integer :number
      t.integer :recipe_id
    end
    add_index :steps, :recipe_id
  end
end
