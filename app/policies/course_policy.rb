class CoursePolicy
  attr_reader :teacher, :course

  def initialize(teacher, course)
    @teacher = teacher
    @course = course
  end

  def destroy?
    course.topics.empty? and course.teacher.eql?(teacher)
  end
end
