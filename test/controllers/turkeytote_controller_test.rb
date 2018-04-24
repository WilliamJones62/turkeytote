require 'test_helper'

class TurkeytoteControllerTest < ActionDispatch::IntegrationTest
  test "should get ret" do
    get turkeytote_ret_url
    assert_response :success
  end

  test "should get retnj" do
    get turkeytote_retnj_url
    assert_response :success
  end

  test "should get retil" do
    get turkeytote_retil_url
    assert_response :success
  end

  test "should get consumer" do
    get turkeytote_consumer_url
    assert_response :success
  end

  test "should get fs" do
    get turkeytote_fs_url
    assert_response :success
  end

  test "should get fsnj" do
    get turkeytote_fsnj_url
    assert_response :success
  end

  test "should get fsil" do
    get turkeytote_fsil_url
    assert_response :success
  end

  test "should get fsga" do
    get turkeytote_fsga_url
    assert_response :success
  end

  test "should get fstx" do
    get turkeytote_fstx_url
    assert_response :success
  end

  test "should get totals" do
    get turkeytote_totals_url
    assert_response :success
  end

  test "should get totalsnj" do
    get turkeytote_totalsnj_url
    assert_response :success
  end

  test "should get totalsil" do
    get turkeytote_totalsil_url
    assert_response :success
  end

  test "should get totalsga" do
    get turkeytote_totalsga_url
    assert_response :success
  end

  test "should get totalstx" do
    get turkeytote_totalstx_url
    assert_response :success
  end

end
