class Admin::OdersController < ApplicationController
   before_action :authenticate_admin!
  def show
    @oder_detail = Oder.find(params[:id])
  end

  def update
    @oder_detail = Oder.find(params[:id])
    if @oder_detail.update(oder_detail_params)
      @oder_items = @oder_detail.oder_items
      if @oder_detail.status == "入金確認"
        @oder_items.update_all(making_status:"制作待ち")
      end
      redirect_to admin_oder_path(params[:id])
    end
  end

  private
    def oder_detail_params
      params.require(:oder).permit(:status)
    end
end