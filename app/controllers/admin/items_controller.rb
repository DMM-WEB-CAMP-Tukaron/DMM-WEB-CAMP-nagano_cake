class Admin::ItemsController < ApplicationController
   before_action :authenticate_admin!


    def index
        @items = Item.page(params[:page]).per(10)
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to admin_item_path(@item)
      else
        render new_admin_item_path
      end
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to root_path
      else
        render "edit"
      end
    end

  private
    def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id, :introduction, :is_active)
    end

end