require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # Utilisateur de type buyer
    @product = products(:one) # Produit existant
    sign_in_as @user
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { product_id: @product.id, quantity: 1 }
    end

    assert_redirected_to orders_url
  end

  test "should not create order for own product" do
    @user.update(role: 'seller_buyer')
    @product.update(seller: @user)
    assert_no_difference('Order.count') do
      post orders_url, params: { product_id: @product.id, quantity: 1 }
    end
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end
end
