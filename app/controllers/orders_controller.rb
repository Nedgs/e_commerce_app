class OrdersController < ApplicationController
    before_action :require_buyer, only: [:create]
  
    def create
      product = Product.find(params[:product_id])
      @order = current_user.orders.build(order_params)
      @order.product = product
      @order.total_price = product.price * @order.quantity
  
      if @order.save
        redirect_to orders_path, notice: 'Order placed successfully'
      else
        redirect_to @order.product, alert: 'Failed to place order'
      end
    end
  
    def index
      @orders = current_user.orders.includes(:product)
    end
  
    private
  
    def order_params
      params.permit(:quantity, :product_id)
    end
  
    def require_buyer
      redirect_to root_path, alert: 'You must be a buyer to perform this action' unless current_user&.buyer?
    end
end
  