require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { address: @contact.address, billto_id: @contact.billto_id, city: @contact.city, contact_type: @contact.contact_type, email: @contact.email, id_cs: @contact.id_cs, name: @contact.name, phone: @contact.phone, rep_id: @contact.rep_id, state-code: @contact.state-code, storenum: @contact.storenum, suite: @contact.suite, zip: @contact.zip } }
    end

    assert_redirected_to contact_url(Contact.last)
  end

  test "should show contact" do
    get contact_url(@contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_url(@contact)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { address: @contact.address, billto_id: @contact.billto_id, city: @contact.city, contact_type: @contact.contact_type, email: @contact.email, id_cs: @contact.id_cs, name: @contact.name, phone: @contact.phone, rep_id: @contact.rep_id, state-code: @contact.state-code, storenum: @contact.storenum, suite: @contact.suite, zip: @contact.zip } }
    assert_redirected_to contact_url(@contact)
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact)
    end

    assert_redirected_to contacts_url
  end
end