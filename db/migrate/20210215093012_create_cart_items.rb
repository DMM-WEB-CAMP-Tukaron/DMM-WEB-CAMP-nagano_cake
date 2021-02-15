class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :item_id
      t.integer :coustomer_id
      t.integer :amount
      t.timestamp :create_at
      t.timestamp :update_at

      t.timestamps
    end
  end
end
