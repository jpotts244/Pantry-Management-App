class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :food_name
      t.string :quantity
      t.date :expiration

      t.timestamps null: false
    end
  end
end
