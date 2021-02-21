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
    if  params[:oder][:oder_address_type] == "0"
    elsif params[:oder][:oder_address_type] == "1"
    elsif params[:oder][:oder_address_type] == "2"
    end
    redirect_to complete_path
  end

  def comfirm
    @customer = current_customer
    @oder = Oder.new(oder_params)
    @cart_items = CartItem.all
    @oder_item = OderItem.all

    case params[:oder_address_type]
    when "0"
      @oder.delivery_postal = current_customer.postal_code #郵便番号
      @oder.postal_address = current_customer.address #住所
      @oder.delivery_name = current_customer.last_name + current_customer.first_name #名前
    end
  end

  private
  def oder_params
    params.require(:oder).permit(:customer_id, :delivery_postal, :postal_address, :delivery_name, :shipping, :payment, :billing_amount, :status )
  end


end
