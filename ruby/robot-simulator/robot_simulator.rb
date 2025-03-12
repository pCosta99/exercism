class Robot
  DIRECTIONS = %i[north east south west]
  MOVEMENT = {
    north: [0, 1],
    east: [1, 0],
    south: [0, -1],
    west: [-1, 0]
  }

  attr_reader :coordinates

  def initialize
    @direction = :north
  end

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)

    @direction = direction
  end

  def turn_right
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) + 1) % 4]
  end

  def turn_left
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) - 1) % 4]
  end

  def bearing
    @direction
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    @coordinates = [MOVEMENT[@direction], @coordinates].transpose.map(&:sum)
  end
end

class Simulator
  COMMANDS = {
    'L' => :turn_left,
    'R' => :turn_right,
    'A' => :advance
  }

  def initialize
    @robots = []
  end

  def instructions(str)
    str.chars.map do |char|
      COMMANDS[char]
    end
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)

    @robots << robot
  end

  def evaluate(robot, str)
    commands = instructions(str)
    bot = @robots.find { |r| r == robot }

    commands.each do |command|
      bot.send(command)
    end
  end
end
