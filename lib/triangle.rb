require 'pry'
class Triangle
attr_reader :a, :b, :c, :sides
  def initialize a, b, c
    @a = a 
    @b = b 
    @c = c 
    @sides = [@a, @b, @c]
  end

  def kind
    is_triangle?
      if a == b && b == c
        :equilateral
      elsif a == b || b == c || c == a
        :isosceles
      else
        :scalene
      end
  end
  
  def is_triangle?
    true_triangle = [(a + b > c), (b + c > a), (a + c > b)]
    sides.each do |side|
      if side <= 0
        true_triangle << false
      end
      true_triangle
    end
    if true_triangle.include?(false)
      raise TriangleError
    end
  end

  class TriangleError < StandardError
    puts "That's not a triangle, y'all."
  end
end