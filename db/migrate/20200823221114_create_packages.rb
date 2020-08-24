class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.belongs_to :product, foreign_key: true, null: false
      t.integer :quantity, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
