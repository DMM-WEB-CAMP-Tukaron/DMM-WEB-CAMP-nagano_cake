class Addre < ApplicationRecord

  belongs_to :customer

  def address_select
    "#{self.address} 〒#{self.postal_code} #{self.name}"
  end

end
