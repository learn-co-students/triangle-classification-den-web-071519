require 'pry'

class Triangle

  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  class TriangleError < StandardError
    def message
      "This triangle is illegal. Pull over."
    end
  end

  def kind 
    if @a <= 0 || @b <= 0 || @c <= 0 || @a + @b <= @c || @b + @c <= @a || @a + @c <= @b
      begin
        raise TriangleError
      # rescue TriangleError => error
      #    puts error.message
      end
    end

    if @a == @b && @a == @c
      return :equilateral
    elsif (@a == @b && @a != @c) || (@b == @c && @a != @c) || (@a == @c && @a != @b) 
      return :isosceles
    else
      return :scalene
    end
  end
end
