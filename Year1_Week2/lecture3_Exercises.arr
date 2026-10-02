use context starter2024
flag-before = above(rectangle(120, 40, "solid", "red"), rectangle(120, 40, "solid", "green"))

flag-before



#| orange triangle with side length 35
|#

#| defining side length and color
|#
side-length = 35

color = "orange"

orange_triangle = triangle(side-length, "solid", color)

orange_triangle2= triangle(35, "solid", "orange")

orange_triangle

orange_triangle2

rect_width = 110

rect_height = 50

r_color = "black"

rectangle_bl = rectangle(rect_width, rect_height, "solid", r_color)

circle_r = 15

c_color = "yellow"

circle_y = circle(circle_r, "solid", c_color)

above(circle_y, rectangle_bl)