class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :description
      t.text :ingredients
      t.text :instructions
      t.integer :cooking_time
      t.integer :servings
      t.string :difficulty
      t.references :category, null: false, foreign_key: true
      t.string :image_url
      
      t.timestamps
    end
    
    add_index :recipes, :title
    add_index :recipes, :difficulty
  end
end