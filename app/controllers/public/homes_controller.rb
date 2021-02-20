class Public::HomesController < ApplicationController

  def top
    @items = Item.all.limit(5)
  end

  def about
  end

end
