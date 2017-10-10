require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { contact_id: @order.contact_id, invoice_date: @order.invoice_date, note: @order.note, order_date: @order.order_date, ponum: @order.ponum, request_ship_date: @order.request_ship_date, seed_year: @order.seed_year, total: @order.total } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { contact_id: @order.contact_id, invoice_date: @order.invoice_date, note: @order.note, order_date: @order.order_date, ponum: @order.ponum, request_ship_date: @order.request_ship_date, seed_year: @order.seed_year, total: @order.total } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
