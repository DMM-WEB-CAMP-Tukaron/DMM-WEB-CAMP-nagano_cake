class Oder < ApplicationRecord

  # 支払い方法選択
  enum billing_amount: { "クレジットカード": 0, "銀行振り込み": 1 }
  enum status: { "入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済み":4}

  belongs_to :customer
  has_many :oder_items, dependent: :destroy

  attachment :image

end
