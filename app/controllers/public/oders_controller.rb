class Public::OdersController < ApplicationController

  def index
    @oders = Oder.all
    @oder = Oder.new
    @addre = Addre.all
  end

  def new
    @oders = Oder.all
    @oder = Oder.new
    @addre = Addre.all

  end

  def create
    @oder = Oder.new(oder_params)
    @oder.save

    redirect_to complete_path
  end

  def edit
  end

  def comfirm
    @customer = current_customer
    @oder = Oder.new
    @cart_items = CartItem.all
    @oder_item = OderItem.all
    if  params[:order][:address_option] == "0"
    elsif params[:order][:address_option] == "1"
    elsif params[:order][:address_option] == "2"
    end
  end

  private
  def oder_params
    params.require(:oder).permit(:customer_id, :delivery_postal, :postal_address, :delivery_name, :shipping, :payment, :billing_amount, :status )
  end

end
