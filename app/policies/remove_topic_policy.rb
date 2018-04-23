class RemoveTopicPolicy
  attr_reader :teacher, :topic

  def initialize(user, post)
    @teacher = teacher
    @topic = topic
  end

  def topic_dont_have_content?
    teacher.any? && topic.materials.null? && topic.questions.null? && topic.tasks.null?
  end

  def topic_have_content?
    teacher.any? || topic.materials.any? || topic.questions.any? || topic.tasks.any?
  end

end
