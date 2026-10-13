use context dcic2024
include csv
include data-source

#Problem 1: Leap Year

fun is_a_leap_year(year :: Number) -> Boolean:
  doc: "determines whether the given year is a leap year, returning true or false"
  
  if (num-modulo(year, 4) == 0):
    true
    
  else:
    
   false
    
  end
  
where: 
    
    is_a_leap_year(2020) is true
    
  is_a_leap_year(2099) is false
   
end

#problem2

fun tick(num_of_seconds :: Number) -> String:
  doc: "outputs the next second that the user inputs, such as a clock is ticking"
  
  if (num_of_seconds >= 60) or (num_of_seconds < 0):
    "invalid"
  else if num_of_seconds == 59:
    num-to-string(0)
  else: 
    num-to-string(num_of_seconds + 1)
  end
  
where:
  tick(46) is "47"
  tick(5000) is "invalid"
  tick(59) is "0"
end

#problem3

fun rock-paper-scissors(p1 :: String, p2 :: String) -> String:
  
  
  ask: 
    | p1 == p2 then: 
      "tie"
    | (p1 == "rock") and (p2 == "scissors") then: 
      "player 1"
    | (p1 == "scissors") and (p2 == "paper") then: 
      "player 1"
    | (p1 == "paper") and (p2 == "rock") then: 
      "player 1"
    | (p2 == "rock") and (p1 == "scissors") then:
      "player 2"
    |(p2 == "scissors") and (p1 == "paper") then:
      "player 2"
    | (p2 == "paper") and (p1 == "rock") then: 
      "player 2"
    | otherwise: "invalid"
  end 
where: 
  rock-paper-scissors("rock", "paper") is "player 2"
  rock-paper-scissors("scissors", "scissors") is "tie"
  rock-paper-scissors("paper", "rock") is "player 1"
end
  
#problem 4
      
planets = table: Planet :: String, Distance :: Number
  row: "Mercury", 0.39
  row: "Venus", 0.72
  row: "Earth", 1
  row: "Mars", 1.52
  row: "Jupiter", 5.2
  row: "Saturn", 9.54
  row: "Uranus", 19.2
  row: "Neptune", 30.06
end

#extracting row 3 and labeling it mars
mars = planets.row-n(3)

#extracting the distance from Mars

mars["Distance"]

#problem 5

something = load-table:
  year :: Number,
  day :: Number, 
  month :: String,
  rate :: Number
  source: csv-table-file("boe_rates.csv", default-options)
  sanitize year using num-sanitizer
  sanitize day using num-sanitizer 
  sanitize rate using num-sanitizer
end

#order-by(dataset, column name)

#check total num of rows


check: 
  something.length() is 835
end

#calculating the median of the rate column 

rate-median = median(something, "rate")

#calculating the mode for the rate 

rate-modes = modes(something, "rate")

#sorting planets by descending order

order-by(something, "rate", false)

#sorting planets table by ascending order

order-by(something, "rate", true)