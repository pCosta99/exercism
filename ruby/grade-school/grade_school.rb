class School
  def initialize
    @grades = Hash.new { |h, k| h[k] = [] }
  end

  def add(student, grade)
    return false if roster.include?(student)

    @grades[grade] << student
    @grades[grade].sort!

    true
  end

  def grade(grade)
    @grades[grade]
  end

  def roster
    @grades.sort_by { |grade, _| grade }.flat_map { |_, students| students }
  end
end
