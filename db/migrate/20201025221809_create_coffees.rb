class CreateCoffees < ActiveRecord::Migration[6.0]
  def change
    create_table :coffees do |t|
      t.string :flavor
      t.string :description
      t.belongs_to :brand, foreign_key: true
      t.belongs_to :user, foreign_key: true 
      

      t.timestamps
    end
  end
end
