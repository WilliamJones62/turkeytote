require 'test_helper'

class HolidaybirdControllerTest < ActionDispatch::IntegrationTest
  test "should get totals" do
    get holidaybird_totals_url
    assert_response :success
  end

  test "should get consumer" do
    get holidaybird_consumer_url
    assert_response :success
  end

  test "should get fsr" do
    get holidaybird_fsr_url
    assert_response :success
  end

  test "should get fsrga" do
    get holidaybird_fsrga_url
    assert_response :success
  end

  test "should get fsril" do
    get holidaybird_fsril_url
    assert_response :success
  end

  test "should get fsrnj" do
    get holidaybird_fsrnj_url
    assert_response :success
  end

  test "should get fsrtx" do
    get holidaybird_fsrtx_url
    assert_response :success
  end

  test "should get fsv" do
    get holidaybird_fsv_url
    assert_response :success
  end

  test "should get fsvga" do
    get holidaybird_fsvga_url
    assert_response :success
  end

  test "should get fsvil" do
    get holidaybird_fsvil_url
    assert_response :success
  end

  test "should get fsvnj" do
    get holidaybird_fsvnj_url
    assert_response :success
  end

  test "should get fsvtx" do
    get holidaybird_fsvtx_url
    assert_response :success
  end

  test "should get ret" do
    get holidaybird_ret_url
    assert_response :success
  end

end
