class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.page(params[:page]).per(1)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id, :introduction, :is_active)
  end
end
