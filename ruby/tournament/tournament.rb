=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

module Tournament
  POINTS = {
    win: 3,
    draw: 1,
    loss: 0
  }

  def self.tally(input)
    scores = input.split("\n").each_with_object({}) do |match, scores|
      team1, team2, result = match.split(";")

      opposite_result = { win: "loss", loss: "win", draw: "draw" }[result.to_sym]

      scores[team1] ||= { win: 0, loss: 0, draw: 0, points: 0 }
      scores[team2] ||= { win: 0, loss: 0, draw: 0, points: 0 }
      scores[team1][result.to_sym] += 1
      scores[team2][opposite_result.to_sym] += 1
      scores[team1][:points] += POINTS[result.to_sym]
      scores[team2][:points] += POINTS[opposite_result.to_sym]
    end

    build_table(scores)
  end

  private

  def self.build_table(scores)
    max_length = 30
    header = "Team".ljust(max_length) + " | MP |  W |  D |  L |  P\n"

    rows = scores.to_a.sort_by { |name, stats| [-stats[:points], name] }.map do |team, stats|
      win, loss, draw, points = stats.values
      total = win + loss + draw
      points_spacing = points >= 10 ? " " : "  "

      "#{team.ljust(max_length)} |  #{total} |  #{win} |  #{draw} |  #{loss} |#{points_spacing}#{points}\n"
    end

    ([header] + rows).join
  end
end
