require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:seller)
    @product = products(:one)
    sign_in_as @user
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get show" do
    get product_url(@product)
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { name: 'New Product', description: 'Description', price: 10, stock: 100 } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { name: 'Updated Product' } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product), params: { source: 'my_products' }
    end

    assert_redirected_to my_products_url
  end

  test "should get my_products" do
    get my_products_url
    assert_response :success
  end
end
