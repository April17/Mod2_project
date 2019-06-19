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

  def project_work_loade(project)
    project_work_loade = project.tasks.map{|task| task.total_working_time}.sum
  end

  def project_work_done(project)
    project_work_done = project.tasks.map{|task| task.total_working_done}.sum
  end

  def project_progress(project)
    if project_work_loade(project) != 0
      (project_work_done(project)/project_work_loade(project)*100).round(2)
    else
      0
    end
  end

  def task_employees(task)
    task_employees = task.employees
    task_employees.map{|employee| employee.name}.join(", ")
  end

end
