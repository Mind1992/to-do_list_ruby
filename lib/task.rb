class Task
  @@all_tasks = []

  def Task.all
    @@all_tasks
  end

  def Task.clear
    @@all_tasks = []
  end

  def initialize(description, status=false, due_date=0, priority=0)
    @description = description
    @status = status
    @due_date = due_date
    @priority = priority
  end

  def description
    @description
  end

  def status
    @status
  end

  def mark_complete
    @status = true
  end

  def due_date
    @due_date
  end

  def scale_due_date(number)
    @due_date = number
  end

  def scale_priority(number)
    @priority = number
  end

  def priority
    @priority
  end

  def save
    @@all_tasks << self
  end

end

