class Admin::OderDetailsController < ApplicationController
#   before_action :authenticate_admin!
  def update
    item = OderItem.find(params[:id])
    if item.update(item_params)
      @oder_detail = item.oder
      if item.making_status == "製作中"
        @oder_detail.update(status:"製作中")
      else
        if @oder_detail.oder_items.exists?(making_status:"着手不可") || @oder_detail.oder_items.exists?(making_status:"制作待ち") || @oder_detail.oder_items.exists?(making_status:"製作中")
          @oder_detail.update(status:"製作中")
        else
          @oder_detail.update(status:"発送準備中")
        end
      end
        redirect_to admin_oder_path(item.oder_id)
    end
  end


  private
    def item_params
      params.require(:oder_item).permit(:making_status)
    end
end
