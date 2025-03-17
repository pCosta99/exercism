class Garden
  STUDENTS = %w[Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry]
  PLANTS = {
    'V' => :violets,
    'C' => :clover,
    'R' => :radishes,
    'G' => :grass
  }

  def initialize(plants)
    @student_plants = STUDENTS.to_h { |student| [student, []] }

    build_garden(plants)
  end

  STUDENTS.each do |student|
    define_method :"#{student.downcase}" do
      @student_plants[student]
    end
  end

  private

  def build_garden(plants)
    plants.split("\n")
          .map { |row| row.chars.map { |char| PLANTS[char] } }
          .map { |row| row.each_slice(2).to_a.zip(STUDENTS) }
          .each do |row|
            row.each do |plants, student|
              @student_plants[student] += plants
            end
          end
  end
end
