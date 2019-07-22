class Triangle

  attr_reader :a, :b, :c

  def initialize (a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && a == c
      :equilateral
    elsif a == b || a == c || b == c
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    if a + b <= c || a + c <= b || b + c <= a
      test = false
    elsif a == 0 || b == 0 || c == 0
      test = false
    else
      test = true
    end
    if test == false
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end
end
