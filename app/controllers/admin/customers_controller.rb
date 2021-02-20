class Admin::CustomersController < ApplicationController

  # def top
    # @oder_items = Orderitems.where(created_at:  Time.zone.now.all_day)
  # end

  
  def index
    @customers = Customer.all
  end 
  
  def show
    @customer = Customer.find(params[:id])
  end 
  
  def edit
    @customer = Customer.find(params[:id])
  end 
  
  def update 
    @customer = Customer.find(params[:id])
      @customer.update(customer_params)
        redirect_to admin_customer_path

  end 
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
  
end 