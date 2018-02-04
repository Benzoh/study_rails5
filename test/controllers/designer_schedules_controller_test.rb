require 'test_helper'

class DesignerSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @designer_schedule = designer_schedules(:one)
  end

  test "should get index" do
    get designer_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_designer_schedule_url
    assert_response :success
  end

  test "should create designer_schedule" do
    assert_difference('DesignerSchedule.count') do
      post designer_schedules_url, params: { designer_schedule: {  } }
    end

    assert_redirected_to designer_schedule_url(DesignerSchedule.last)
  end

  test "should show designer_schedule" do
    get designer_schedule_url(@designer_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_designer_schedule_url(@designer_schedule)
    assert_response :success
  end

  test "should update designer_schedule" do
    patch designer_schedule_url(@designer_schedule), params: { designer_schedule: {  } }
    assert_redirected_to designer_schedule_url(@designer_schedule)
  end

  test "should destroy designer_schedule" do
    assert_difference('DesignerSchedule.count', -1) do
      delete designer_schedule_url(@designer_schedule)
    end

    assert_redirected_to designer_schedules_url
  end
end
