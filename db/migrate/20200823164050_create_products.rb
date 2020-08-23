class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :volume, null: false
      t.column :container_material, :integer, null: false
    end
  end
end
