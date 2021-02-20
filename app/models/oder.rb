class Oder < ApplicationRecord

  enum billing_amount: { "クレジットカード": 0, "銀行振り込み": 1 }

  belongs_to :customer
  has_many :oder_items, dependent: :destroy

  attachment :image

end
