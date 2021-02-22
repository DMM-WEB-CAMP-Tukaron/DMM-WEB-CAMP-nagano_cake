class Public::OdersController < ApplicationController

  def index
    @oders = Oder.all
    @addre = Addre.all
    @oder_items = OderItem.all
  end

  def new
    @oders = Oder.all
    @oder = Oder.new
    @addre = Addre.all
  end

  def create
    @oder = Oder.new(oder_params)
    @oder.customer_id = current_customer.id
    if @oder.save!
       current_customer.cart_items.each do |cart_item|
        @oder_items = OderItem.new(
          item_id: cart_item.item.id,
          amount: cart_item.amount,
          price: cart_item.item.price,
          oder_id: @oder.id)
        @oder_items.save!
      end
    end
    redirect_to complete_path
  end

  def comfirm
    @customer = current_customer
    @oder = Oder.new(oder_params)
    @cart_items = CartItem.all
    @oder_item = OderItem.all

    case params[:oder_address_type]
    when "0" #自分の住所
      @oder.delivery_postal = current_customer.postal_code #郵便番号
      @oder.postal_address = current_customer.address #住所
      @oder.delivery_name = current_customer.last_name + current_customer.first_name #名前

    when "1" #登録してある住所
    @addre = Addre.find(params[:oder][:addre_id])
      @oder.delivery_postal = @addre.postal_code #郵便番号
      @oder.postal_address = @addre.address #住所
      @oder.delivery_name = @addre.name #名前

    when "2"

    end

  end

  def complete
  end

  def show
    @oder = Oder.find(params[:id])
  end

  private
  def oder_params
    params.require(:oder).permit(:customer_id, :delivery_postal, :postal_address, :delivery_name, :shipping, :payment, :billing_amount, :status, :created_at )
  end

  def set_order
    params.require(:oder).permit(:customer_id, :delivery_postal, :postal_address, :delivery_name, :shipping, :payment, :billing_amount, :status, :created_at )
  end

end
