class OderItem < ApplicationRecord

   belongs_to :item
   belongs_to :oder

   enum making_status: {"まだ":0, "作ってる":1, "作り終わった":3}
end
