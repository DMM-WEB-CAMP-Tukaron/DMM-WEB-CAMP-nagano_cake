class Admin::HomesController < ApplicationController
   before_action :authenticate_admin!
    def top
      case params[:sort]
        when "0"

          @customer = Customer.find(params[:format])
          @oders = @customer.oders
        else
          @oders = Oder.all
      end
    end
end
