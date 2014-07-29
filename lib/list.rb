class List
  @@all_lists = []

  def List.all
    @@all_lists
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

