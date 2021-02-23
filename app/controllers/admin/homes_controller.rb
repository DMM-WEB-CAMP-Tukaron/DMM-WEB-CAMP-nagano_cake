class Admin::HomesController < ApplicationController
   before_action :authenticate_admin!
    def top
      case params[:sort]
        when "0"

          @customer = Customer.find(params[:format])
          @oders = @customer.oders.page(params[:page]).per(10)
        else
          @oders = Oder.page(params[:page]).per(10)
      end
    end
end