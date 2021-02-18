class Public::AddresController < ApplicationController

  def index
    @customer = current_customer
    @addre = Addre.new
  end

  def new
    @addre = Addre.new
  end

  def create
    @addre = Addre.new(addre_params)
    
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