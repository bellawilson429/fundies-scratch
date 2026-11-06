use context dcic2024
include csv
include data-source
#Task 1 - Task Plan

#| 
   Problem: have to load the flights_sample53.csv file into our Github and assign it to a variable
   Planned Step: write every single column name and its variable type. Then reference the source of the file and sanitize all numeric values.
   Implementation: use csv-table-file("name_of_file.csv", default options) and put at the top of the window "include data source" and "include csv"
   
   Problem: the tailnum column has missing values that we need to replace as "UNKNOWN"
   Planned Step: filter the tailnum column in the flights_53 table to find the missing values, then fix "" with "UNKNOWN"
   Implementation: use transform column with a lambda function to switch the "" to "UNKNOWN"
   
   Problem: negative values of dep_delay and arr_delay have to be replaced with 0
   Planned Step: use a lambda to locate negative values and switch them to 0 using the transform-column
   Implementation: transform column function
   
   Problem: must concatenate flight, carrier and dep_time and create a new column
   Planned Step: combine the 3 strings into a new string, and then build a new column 
   implementation: use build column and string-append function
|#
#Task 2 
flights_53 = load-table:
  rownames :: Number,
  dep_time :: Number,
  sched_dep_time :: Number,
  dep_delay :: Number,
  arr_time :: Number,
  sched_arr_time :: Number,
  arr_delay :: Number,
  carrier :: String,
  flight :: Number,
  tailnum :: String,
  origin :: String,
  dest :: String,
  air_time :: Number,
  distance :: Number,
  hour :: Number,
  minute :: Number,
  time_hour :: String
  source: csv-table-file("flights_sample53.csv", default-options)
  sanitize rownames using num-sanitizer
  sanitize dep_time using num-sanitizer
  sanitize sched_dep_time using num-sanitizer
  sanitize dep_delay using num-sanitizer
  sanitize arr_time using num-sanitizer
  sanitize sched_arr_time using num-sanitizer
  sanitize arr_delay using num-sanitizer
  sanitize flight using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
end

#Task 2 Problem 1

cleaner_missing = transform-column(flights_53, "tailnum", lam(r): 
    if r == "":
      "UNKNOWN"
    else:
      r
    end
  end)

cleaner_negs_dep_delay = transform-column(flights_53, "dep_delay", lam(r): 
    if r < 0: 
      0
    else: 
      r
    end
  end)
cleaner_negs_dep_delay

cleaner_negs_arr_delay = transform-column(cleaner_negs_dep_delay, "arr_delay", lam(r): 
    if r < 0:
      0
    else:
      r
    end
  end)
cleaner_negs_arr_delay

#Task 2 Problem 3


new_flights_53 = build-column(flights_53, "dedup_key", lam(r): 
    
    fun num_to_string(n :: Number) -> String:
      doc: "turns a number into a String"
      num-to-string(n)
    end
    
    new_flight = num_to_string(r["flight"])
    
      fun trim(s:: String) -> String:
  doc: "Remove spaces from the given string."
  n = string-length(s)
  if n == 0:
    ""
  else:
    string-replace(s, " ", "")
  end
      end
    new_carrier = trim(r["carrier"])

    fun norm_time(n :: Number) -> String:
      doc: "separates the hours from the minutes"
      block:
        dep_time_n = n / 100
        h = num-floor(n / 100)
        m = n - (h * 100)
        var hh = ""
        if hh < 10:
          hh := string-append("0", to-string(h))
        else:
          hh := to-string(h)
        end
    end
    
    end
    new_dep_time= norm_time(r["dep_time"]) 
    
    new_flight + "-" + new_carrier + "-" + new_dep_time
  end)

new_flights_53
