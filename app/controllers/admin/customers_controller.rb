class Admin::CustomersController < ApplicationController

  def top
    @oder_items = Orderitems.where(created_at:  Time.zone.now.all_day)
  end

  
