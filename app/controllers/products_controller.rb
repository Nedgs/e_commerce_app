class ProductsController < ApplicationController
    before_action :set_product, only: %i[show edit update destroy]
    before_action :require_seller, except: %i[index show]
  
    def index
      @products = Product.all
    end
  
    def show
    end
  
    def new
      @product = Product.new
    end
  
    def create
      @product = current_user.products.build(product_params)
  
      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
        @product.destroy
        if params[:source] == 'my_products'
          redirect_to my_products_path, notice: 'Product was successfully destroyed.'
        else
          redirect_to products_url, notice: 'Product was successfully destroyed.'
        end
    end
  
    def my_products
      @products = current_user.products
    end
  
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :image)
    end
  
    def require_seller
      redirect_to root_path, alert: 'You must be a seller to perform this action' unless current_user&.seller? || current_user&.seller_buyer?
    end
end
  