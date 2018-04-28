class TopicPolicy
  attr_reader :teacher, :topic

  def initialize(teacher, topic)
    @teacher = teacher
    @topic = topic
  end

  def destroy?
    return false
    owner? && topic_empty?
  end

  def owner?
    @topic.course.teacher == @teacher
  end

  def topic_empty?
    topic.materials.empty? && topic.questions.empty? && topic.tasks.empty?
  end


end
