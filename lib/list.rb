class List
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

