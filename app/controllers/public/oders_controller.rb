class Public::OdersController < ApplicationController

  def index
    @oders = Oder.all
    @oder = Oder.new
    @addre = Addre.all
  end

  def new
    @oder = Oder.new
  end

  def create
    @oder = Oder.new(oder_params)
    @oder.save
    redirect_to oder_path(@oder)
  end

  def edit
  end
  
  def show
    @oder = Oder.find(params[:id])
  end

  private
  def oder_params
    params.require(:oder).permit(:customer_id, :delivery_postal, :postal_address, :delivery_name, :shipping, :payment, :billing_amount, :status )
  end

end
