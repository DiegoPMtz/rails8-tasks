require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "should not save task without title" do
    task = Task.new
    assert_not task.save, "Saved the task without a title"
  end

  test "should not save task without description" do
    task = Task.new(title: "Lavar el auto")
    assert_not task.save, "Saved the task without a description"
  end

  test "should not save task with description less than 12 characters" do
    task = Task.new(title: "Lavar el auto", description: "Lavar auto")
    assert_not task.save, "Saved the task with a description less than 12 characters"
  end

  test "should save default status as not_started" do
    task = Task.new(title: "Lavar el auto", description: "Lavar el auto el domingo")
    task.save
    assert_equal task.status, "not_started", "Status is not set to not_started"
  end
end
