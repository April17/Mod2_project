class Utility
  # attr_reader :name
  #
  # def initialize(name)
  #   @name = name
  # end

  def task_progress(task)
    task.total_working_done = task.employee_tasks.map{|employeetask| employeetask.hours_done}.sum
    task.save
    (task.total_working_done/task.total_working_time*100).round(2)
  end

  def project_progress(project)
    project_work_loade = project.tasks.map{|task| task.total_working_time}.sum
    project_work_done = project.tasks.map{|task| task.total_working_done}.sum
    (project_work_done/project_work_loade*100).round(2)
  end
end
