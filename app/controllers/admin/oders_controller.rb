class Admin::OdersController < ApplicationController

  def show
    @oder_detail = Oder.find(params[:id])
  end

  def update
    @oder_detail = Oder.find(params[:id])
    if @oder_detail.update(oder_detail_params)
      redirect_to admin_homes_top_path(@oder_detail)
    end
  end

  private
    def oder_detail_params
      params.require(:oder).permit(:status)
    end
end