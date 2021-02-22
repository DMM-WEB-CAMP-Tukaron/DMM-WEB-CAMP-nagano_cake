class Admin::OderDetailsController < ApplicationController

  def update
    item = OderItem.find(params[:id])
    if item.update(item_params)
      redirect_to admin_oder_path(item.oder_id)
    end
  end


  private
    def item_params
      params.require(:oder_item).permit(:making_status)
    end
end
