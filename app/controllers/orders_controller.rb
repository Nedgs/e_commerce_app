class OrdersController < ApplicationController
    before_action :require_buyer
  
    def create
      product = Product.find(params[:product_id])
      @order = current_user.orders.build(order_params)
      @order.product = product
      @order.total_price = product.price * @order.quantity
  
      if @order.save
        redirect_to @order.product, notice: 'Order placed successfully'
      else
        redirect_to @order.product, alert: 'Failed to place order'
      end
    end
  
    private
  
    def order_params
      params.require(:order).permit(:quantity)
    end
  
    def require_buyer
      redirect_to root_path, alert: 'You must be a buyer to perform this action' unless current_user&.buyer?
    end
end
  