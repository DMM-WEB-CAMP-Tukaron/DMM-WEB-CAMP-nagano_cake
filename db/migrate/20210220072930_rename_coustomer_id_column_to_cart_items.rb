class RenameCoustomerIdColumnToCartItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :cart_items, :coustomer_id, :customer_id
  end
end
