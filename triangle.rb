# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)

	sorted = [a, b, c].sort
	raise TriangleError if sorted[0] <= 0
	raise TriangleError if sorted[0] + sorted[1] <= sorted[2]




	if a == b and b == c
		return :equilateral
	
	elsif a != b
		if b != c and a != c
			return :scalene
		else
			return :isosceles	
		end	
	else
		return :isosceles
	end











end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError









end
