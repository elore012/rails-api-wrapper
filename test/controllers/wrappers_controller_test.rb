require "test_helper"

class WrappersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wrapper = wrappers(:one)
  end

  test "should get index" do
    get wrappers_url
    assert_response :success
  end

  test "should get new" do
    get new_wrapper_url
    assert_response :success
  end

  test "should create wrapper" do
    assert_difference('Wrapper.count') do
      post wrappers_url, params: { wrapper: {  } }
    end

    assert_redirected_to wrapper_url(Wrapper.last)
  end

  test "should show wrapper" do
    get wrapper_url(@wrapper)
    assert_response :success
  end

  test "should get edit" do
    get edit_wrapper_url(@wrapper)
    assert_response :success
  end

  test "should update wrapper" do
    patch wrapper_url(@wrapper), params: { wrapper: {  } }
    assert_redirected_to wrapper_url(@wrapper)
  end

  test "should destroy wrapper" do
    assert_difference('Wrapper.count', -1) do
      delete wrapper_url(@wrapper)
    end

    assert_redirected_to wrappers_url
  end
end
