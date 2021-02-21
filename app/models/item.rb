class Item < ApplicationRecord

  has_many :oder_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre


  attachment :image
  enum is_active: { "販売停止": false, "販売中": true }
end
