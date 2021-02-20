class Oder < ApplicationRecord

  enum billing_amount:    [ :クレジットカード, :銀行振り込み ]

  belongs_to :customer
  has_many :oder_items, dependent: :destroy

  attachment :image

end
