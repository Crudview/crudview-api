class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image_url
      t.float :rating
      t.string :price
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
