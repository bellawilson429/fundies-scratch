use context dcic2024
include csv
include data-source

flights = load-table:
  row_names :: Number,
  dep_time :: Number,
  sched_dep_time :: Number,
  dep_delay :: Number,
  arr_time :: Number,
  sched_arr_time :: Number,
  arr_delay :: Number,
  carrier :: String,
  flight :: String, 
  tailnum :: String,
  origin :: String, 
  dest :: String,
  air_time :: Number, distance :: Number,
  hour :: Number,
  minute :: Number, time_hour :: String
  source: csv-table-file("flights.csv", default-options)
  sanitize row_names using num-sanitizer
  sanitize dep_time using num-sanitizer
  sanitize sched_dep_time using num-sanitizer
  sanitize dep_delay using num-sanitizer
  sanitize arr_delay using num-sanitizer
  sanitize arr_time using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
end

#Exercise 1 Problem 2: creation of longest flight checker

fun is_long_flight(r :: Row) -> Boolean:
doc: "checks if the flight is long by checking if distance is longer than 1500"

  r["distance"] >= 1500

where:
  is_long_flight(flights.row-n(0)) is false
  is_long_flight(flights.row-n(1)) is false
end

#Exercise 1 Problem 3: filtering longest flights

long_flights = filter-with(flights, is_long_flight)

long_flights

#Exercise 1 Problem 4: ordering longest flights in ascending/descending order

long_flights_desc = order-by(long_flights, "air_time", false)


long_flights_asc = order-by(long_flights, "air_time", true)

#Exercise 1 Problem 5: extraction of carrier, origin, and destination

long_flights_desc.row-n(0)["carrier"]

long_flights_desc.row-n(0)["origin"] 

long_flights_desc.row-n(0)["dest"]

#Exercise 2 Problem 1: defining a delayed departure checker 

fun is_delayed_departure(r :: Row) -> Boolean:
  doc: "checks if flights are delayed 30 minutes or longer"
  r["dep_delay"] >= 30
where: 
  is_delayed_departure(flights.row-n(0)) is false
  is_delayed_departure(flights.row-n(55)) is true
end 

#Exercise 2 Problem 2: morning flight checker 

fun is_morning_sched_dep(r :: Row) -> Boolean:
  doc: "checks if the scheduled departure time of a certain flight is before noon"
  r["sched_dep_time"] < 1200
where: 
  is_morning_sched_dep(flights.row-n(0)) is true
  is_morning_sched_dep(flights.row-n(300)) is false
end

#Exercise 2 Problem 3: filter-with functions using lambda

filtered_deps = filter-with(flights, lam(n): n["dep_delay"] >= 30 end)

filtered_deps_AM = filter-with(filtered_deps, lam(n): n["sched_dep_time"] < 1200 end)

#Exercise 2 Problem 4: more filtering 

long_filtered_flights_AM = filter-with(filtered_deps_AM, lam(n): n["distance"] > 500 end)

#Exercise 2 Problem 5: using descending order

worst_desc = order-by(long_filtered_flights_AM, "dep_delay", false)

#Exercise 2 Problem 6: Extraction of flight, origin, and dep_delay

worst_desc.row-n(0)["flight"]

worst_desc.row-n(0)["origin"]

worst_desc.row-n(0)["dep_delay"]

#Exercise 3 Problem 1

nil_deps = transform-column(flights, "dep_delay", lam(n):
    
    if n < 0: 
    0
    else: 
      n
    end
  end)

nil_arr = transform-column(flights, "arr_delay", lam(n):
    
    if n < 0: 
    0
    else: 
      n
    end
  end)

#Exercise 3 Problem 2: constructing the effective speed column

flights_speed = build-column(flights, "effective_speed", lam(n): 
    if n["distance"] > 0: 
      n["distance"] / (n["air_time"] / 60)
    else: 0
    end
  end)

#Exercise 3 Problem 3: descending order in speed

order-by(flights_speed, "effective_speed", false)

#Exercise 3 Problem 4: extracting fastest flight

flights_speed.row-n(0)["carrier"]

flights_speed.row-n(0)["origin"]

flights_speed.row-n(0)["dest"]

#Exercise 4 Problem 1: creating arrival discount function

fun apply-arrival-discount(t :: Table) -> Table:
  doc: "takes the inputted table and reduces the arrival delay by 20% only if its between 0-45 min"
  transform-column(t, "arr_delay", lam(n): 
      if (0 <= n) and (45 >= n): 
        n * 0.8 
        else: n 
      end
    end)
where: 
  test = table: arr_delay :: Number
    row: -10
    row: 0
    row: 30
    row: 60
  end
  expected = table: arr_delay :: Number
    row: -10
    row: 0
    row: 24
    row: 60
  end
      apply-arrival-discount(test) is expected
end

apply-arrival-discount(flights)

#Exercise 4 Problem 2: b

discount_new = build-column(flights, "on_time_score", lam(n):
    block: if n["dep_delay"]  < 0:
        0
        else: 
        n["dep_delay"]
    end
    if n["arr_delay"] < 0:
      0
    else:
      n["arr_delay"]
    end
    score = 100 - (n["dep_delay"] - n["arr_delay"]) - (n["air_time"] / 30)
      if score < 0:
      0
    else: 
        score
      end
  end
  end)

#Exercise 4 Problem 3: descending and ascending order

discount_desc= order-by(discount_new, "on_time_score", false)

discount_asc = order-by(discount_new, "on_time_score", true)

#Exercise 4 Problem 4: best two performing flights

discount_desc.row-n(0)["carrier"]
discount_desc.row-n(0)["flight"]
discount_desc.row-n(0)["origin"]
discount_desc.row-n(0)["dest"]

discount_desc.row-n(1)["carrier"]
discount_desc.row-n(1)["flight"]
discount_desc.row-n(1)["origin"]
discount_desc.row-n(1)["dest"]

#Problem 4 Question 5: No I don't think it's fair because the score system grades the air time, so longer flights have worse scores. Maybe comparing each flight to the average delay from the same route is better so that distance isn't a factor anymore.