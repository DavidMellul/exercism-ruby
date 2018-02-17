class School
  def initialize
    @students = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(name, grade)
    @students[grade] = (@students.dup[grade] << name).sort
  end

  def students(grade)
    @students[grade]
  end

  def students_by_grade
    @students.sort.map { |grade, students| { grade: grade, students: students } }
  end
end

module BookKeeping
  VERSION = 3
end
