require 'pry'

class Triangle

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
    @sides_array = [@side_1, @side_2, @side_3]
  end

  def uniq_sides_count
    @sides_array.uniq.count
  end

  def correct_lengths?
    @sides_array.map.with_index { |side, i|
      side + @sides_array[(i + 1)%3] > @sides_array[(i + 2)%3]}.all?
  end

  def triangle?
    if (self.correct_lengths?) && (!@sides_array.include?(0))
      true
    else
      false
    end
  end

  def kind
    if self.triangle? == false
      raise TriangleError
    else
      if self.uniq_sides_count == 1
        :equilateral
      elsif self.uniq_sides_count == 2
        :isosceles
      else
        :scalene
      end
    end
  end

  class TriangleError < StandardError
  end

end

# new = Triangle.new(1, 2, 3)
