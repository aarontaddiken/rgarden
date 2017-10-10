require 'test_helper'

class OrderShipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_shipment = order_shipments(:one)
  end

  test "should get index" do
    get order_shipments_url
    assert_response :success
  end

  test "should get new" do
    get new_order_shipment_url
    assert_response :success
  end

  test "should create order_shipment" do
    assert_difference('OrderShipment.count') do
      post order_shipments_url, params: { order_shipment: { order_id: @order_shipment.order_id, ship_date: @order_shipment.ship_date, tracking_number: @order_shipment.tracking_number } }
    end

    assert_redirected_to order_shipment_url(OrderShipment.last)
  end

  test "should show order_shipment" do
    get order_shipment_url(@order_shipment)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_shipment_url(@order_shipment)
    assert_response :success
  end

  test "should update order_shipment" do
    patch order_shipment_url(@order_shipment), params: { order_shipment: { order_id: @order_shipment.order_id, ship_date: @order_shipment.ship_date, tracking_number: @order_shipment.tracking_number } }
    assert_redirected_to order_shipment_url(@order_shipment)
  end

  test "should destroy order_shipment" do
    assert_difference('OrderShipment.count', -1) do
      delete order_shipment_url(@order_shipment)
    end

    assert_redirected_to order_shipments_url
  end
end
