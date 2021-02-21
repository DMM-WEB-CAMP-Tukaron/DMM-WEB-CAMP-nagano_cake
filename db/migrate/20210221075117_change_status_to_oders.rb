class ChangeStatusToOders < ActiveRecord::Migration[5.2]
  def change

    change_column :oders, :status, :integer, default: 0
    change_column :oders, :billing_amount, :integer, default: 0
    change_column :oder_items, :making_status, :integer, default: 0
    change_column :items, :is_active, :boolean, default: true

  end
end
