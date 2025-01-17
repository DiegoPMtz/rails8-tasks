require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should create task" do
    assert_difference("Task.count") do
      post tasks_path, params: { task: { title: "Lavar el auto", description: "Lavar el auto el domingo" } }
    end
    assert_redirected_to task_path(Task.last)
  end

  test "should edit task" do
    task = tasks(:one)
    patch task_path(task), params: { task: { title: "Lavar el auto", description: "Lavar el auto el domingo" } }
    assert_redirected_to task_path(task)
  end

  test "should destroy task" do
    task = tasks(:one)
    assert_difference("Task.count", -1) do
      delete task_path(task)
    end
    assert_redirected_to tasks_path
  end

  test "should not create task without title" do
    post tasks_path, params: { task: { description: "Lavar el auto el domingo" } }
    assert_response :unprocessable_entity
  end
end
