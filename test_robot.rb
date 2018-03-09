require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    r = Robot.new()
    # act
    r.needs_repairs = true
    r.foreign_model = true
    expected_result = 1
    # assert
    assert_equal(expected_result, r.station)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    r = Robot.new()
    # act
    r.needs_repairs = true
    r.vintage_model = true
    expected_result = 2
    # assert
    assert_equal(expected_result, r.station)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    r = Robot.new()
    # act
    r.needs_repairs = true
    expected_result = 3
    # assert
    assert_equal(expected_result, r.station)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    r = Robot.new()
    # act
    expected_result = 4
    # assert
    assert_equal(expected_result, r.station)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    r = Robot.new()
    # act
    r.todos.empty? == true
    expected_result = -1
    # assert
    assert_equal(expected_result, r.prioritize_tasks)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    r = Robot.new
    r.todos=([1,2,3])
    # act
    expected_result = 3
    # assert
    assert_equal(expected_result, r.prioritize_tasks)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    r = Robot.new
    r.day_off = ("saturday")
    # act
    expected_result = false
    # assert
    assert_equal(expected_result, r.workday?("saturday"))
  end

  def test_workday_not_day_off_returns_true
    # arrange
    r = Robot.new
    r.day_off = (Time.now)
    # act
    expected_result = true
    # assert
    assert_equal(expected_result, r.workday?(Time.now))
  end

end
