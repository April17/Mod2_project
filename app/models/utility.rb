class Utility

  def task_progress(task)
    work_done = task.employee_tasks.map{|employeetask| employeetask.hours_done}.sum
    (work_done/task.total_working_time*100).round(2)
  end

end
