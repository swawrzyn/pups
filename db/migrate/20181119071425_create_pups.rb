class CreatePups < ActiveRecord::Migration[5.2]
  def change
    create_table :pups do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
