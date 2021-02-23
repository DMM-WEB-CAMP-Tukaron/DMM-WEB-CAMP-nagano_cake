class Public::AddresController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @addres = @customer.addres.page(params[:page]).per(3)
    @addre = Addre.new
  end

  def create
    @addre = Addre.new(addre_params)
    @addre.customer_id = current_customer.id
    @addre.save
    redirect_to addres_path
  end

  def edit
    @addre = Addre.find(params[:id])
  end

  def update
    @addre = Addre.find(params[:id])
    @addre.update(addre_params)
    redirect_to addres_path
  end

  def destroy
    @addre = Addre.find(params[:id])
    @addre.destroy
    redirect_to addres_path
  end

  private
  def addre_params
    params.require(:addre).permit(:postal_code, :address, :name)
  end

end