class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

	def index
		@cart_items = CartItem.all
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to cart_items_path
	end

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.customer_id = current_customer.id
		@a = false
		current_customer.cart_items.each do |cart_item|
			if @cart_item.item_id == cart_item.item_id
				new_amount = cart_item.amount + @cart_item.amount
				cart_item.update_attribute(:amount, new_amount)
				@a = true
				break
			end
		end
		unless @a
			@cart_item.save
		end
		redirect_to cart_items_path
	end

	def destroy
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to cart_items_path
	end

	def destroy_all
		@cart_items = current_customer.cart_items
		@cart_items.destroy_all
		redirect_to cart_items_path
	end

	private

	def cart_item_params
		params.require(:cart_item).permit(:amount, :item_id)
	end
end
