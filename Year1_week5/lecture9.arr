use context dcic2024
include csv
include data-source
#| Plan a task before coding it, then finding and cleaning dirty data 
   visualization
|#

#| task plan = to-do list you can check off
|#

#| input = columns you start from 
output = concrete example of what you want at the end
steps = small enough that each one is a single function or table operation
tools = the operations for each step: filter-with, transform-column
  |#

#load voters data 
voter-data = load-table: VoterID, DOB, Party, Address, City, County, Postcoe
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/voters.csv", default-options)
end

voter-data.row-n(0)["VoterID"]

#confirm the party problem

filter-with(voter-data, lam(r): r["Party"] == "Labour" end).length() # computes the number of times this is true

voter-data.row-n(3)["Party"]

order-by(count(voter-data, "Party"), "count", false)

#descending = largest to smallest

#read one value with get-column

fun get-column(r :: Row, colname :: String):
  doc: "returns the value in row r for the column colname"
  r[colname]
where: 
  get-column(voter-data.row-n(3), "Party") is "Labuor"
  get-column(voter-data.row-n(0), "VoterID") is "1"
  
end

filter-with(voter-data, lam(r): get-column(r, "Party") == "Labour" end).length()

get-column(voter-data.row-n(3), "Party")

with-year = build-column(voter-data, "BirthYear", lam(r): string-substring(get-column(r, "DOB"), 6, 10)end)

get-column(with-year.row-n(0), "BirthYear")
  
#fixing the typo

fun fix-labour(s :: String) -> String:
  doc: "corrects the one known mispelling of Labour"
  block:
  if s == "Labuor":
    "Labour"
    else if s == "":
      "None"
  else: 
    s
  end
  end
where: 
    fix-labour("Labuor") is "Labour"
  # fix-labour("") is "None"
  fix-labour("Green Party") is "Green Party"
end

#try using transform-column
fixed = transform-column(voter-data, "Party", fix-labour)


fixed_asc = order-by(fixed, "Party", true)

freq-bar-chart(fixed, "Party")

freq-bar-chart(fixed_asc, "Party")