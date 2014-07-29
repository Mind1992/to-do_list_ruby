class List
  @@all_lists = []

  def List.all
    @@all_lists
  end

  def List.clear
    @@all_lists = []
  end

  def sort_by_name
    @tasks.sort_by {|task| task.description}
  end

  def sort_by_date
    @tasks.sort_by {|task| task.due_date }
  end

  def sort_by_priority
    @tasks.sort_by {|task| task.priority }
  end

  def save
    @@all_lists << self
  end

	def initialize(name)
		@name = name
    @tasks = []
	end

	def tasks
		@tasks
	end

  def name
    @name
  end

	def add_task(task)
		@tasks << task
	end
end

