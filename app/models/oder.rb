class Oder < ApplicationRecord  
  
  enum billing_amount:    [ :クレジットカード, :銀行振り込み ]
  enum status: [ :入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]
 
  belongs_to :customer
  has_many :oder_items, dependent: :destroy

end
