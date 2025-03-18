class ComplexNumber
  attr_reader :a, :b

  def initialize(a, b = 0)
    @a = a
    @b = b
  end

  def real
    @a
  end

  def imaginary
    @b
  end

  def +(other)
    c = other.a
    d = other.b

    ComplexNumber.new(a + c, b + d)
  end

  def -(other)
    c = other.a
    d = other.b

    ComplexNumber.new(a - c, b - d)
  end

  def *(other)
    c = other.a
    d = other.b

    new_a = a * c - b * d
    new_b = b * c + a * d

    ComplexNumber.new(new_a, new_b)
  end

  def /(other)
    self * other.inv
  end

  def abs
    Math.sqrt(a**2 + b**2)
  end

  def conjugate
    ComplexNumber.new(a, -b)
  end

  def inv
    new_a = a / abs**2
    new_b = -b / abs**2

    ComplexNumber.new(new_a, new_b)
  end

  def exp
    ComplexNumber.new(Math.exp(a)) * ComplexNumber.new(Math.cos(b), Math.sin(b))
  end

  def ==(other)
    (self - other).abs < 1e-15
  end
end
