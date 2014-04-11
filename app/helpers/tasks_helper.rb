module TasksHelper
  def image_for_task(task)
    image = task.completed? ? "checked-in.png" : "checked.png"
    image_tag image
  end
end