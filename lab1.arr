use context starter2024
# T-Shirt Shop Exercise

#| Outline:
   calculate: 
   initial fee + (12 * # of identical shirts)
|#

# Calculating Cost Part 1
3 + (12 * 5)

#Calculating Cost Part 2
3 + (12 * 7)
      

#Rectangular Poster Part 1

# Perimeter = 2 * (width + height)

2 * (420 + 594)

# Rectangular Poster Part 2

0.1 * (2 * (420 + 594))

#| If you forget 
   the parentheses,
   the computer will not
 understand which order you 
   want the operations to be 
   done in, thus you will 
   get an error.
|#


#String Surprises

#Saving a Tagline Part 1
"Designs for everyone!"

#Saving a Tagline part 2
#"Designs for everyone!

#Colour Inventory part 1
"red " + "blue " + "gold " + "purple"

#Colour Inventory Part 2
"red" + "blue"

#|
   In line above, the two strings will concatanate |#
#Colour Inventory Part 2
# 1 + "blue"

#|
   The line above will not 
   run because a string and 
   a number are added together.
   Results in an error message
   due to two different data types
|#


#Make a Traffic Light

#Frame

rectangle(80, 200, "solid", "black")

#red light

overlay-xy(circle(25, "solid", "red"), -15, -25, rectangle(80, 200, "solid", "black"))

#red and yellow light
overlay-xy(below-align("middle", circle(25, "solid", "red"), circle(25, "solid", "yellow")), -15, -25, rectangle(80, 200, "solid", "black"))

#red, yellow and green light

overlay-xy(below-align("middle", circle(25, "solid", "red"), below-align("middle", circle(25, "solid", "yellow"), circle(25, "solid", "green"))), -15, -25, rectangle(80, 200, "solid", "black"))

#|
   Traffic Light with a rectangular pole

|#


below-align("middle", overlay-xy(below-align("middle", circle(25, "solid", "red"), below-align("middle", circle(25, "solid", "yellow"), circle(25, "solid", "green"))), -15, -25, rectangle(80, 200, "solid", "black")), rectangle(20, 100, "solid", "black"))


#| used the below command
   to place the rectangular pole below the traffice light image 
|#

#Broken Code Hunt

#Goal: A rectangle with width 50 and height 20, solid black

rectangle(50, 20, "solid", "black")

#| To fix this code, I switched the order of the inputs, so that the order of the inputs are width, height, type of fill, and color. This didn't work due to the wrong data type being inputted. For example, a number was entered where there was supposed to be a string and vice versa.|#

circle(30, "solid", "red")

#| To fix this code, I changed the word 'solid' to have double quotations around it. Every string must have quotes in order to be read as a proper string input |# 

#Flag 

# defining width and height
rect-width = 40

rect-height = 100

#stripes

green_stripe = rectangle(rect-width, rect-height, "solid", "dark green")

red_stripe = rectangle(rect-width,rect-height,"solid", "red")

two_stripes= beside(green_stripe, red_stripe)

yellow_stripe = rectangle(rect-width, rect-height, "solid", "yellow")

flag_base = beside(two_stripes, yellow_stripe)

#star in the middle

star_length = 20

star_1 = star(star_length, "solid", "yellow")

overlay-xy(star_1, -45, -35, flag_base)