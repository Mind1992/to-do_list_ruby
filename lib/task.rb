class Task

  def initialize(description, status=false)
    @description = description
    @status = status
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
end
