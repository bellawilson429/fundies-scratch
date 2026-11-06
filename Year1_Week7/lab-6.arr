use context dcic2024
#Isabella Wilson

#Task 1

3 * 3.20 #=> 9.6
"Oat" + " " + "latte" #=> "Oat latte"
string-length("cappuccino") #=> 10

#Task 2

latte-price :: Number = 3.20

fun order-cost(drinks_num :: Number, price_num :: Number) -> Number:
  doc: "returns the cost of an order based on the number of drinks and their price"
  drinks_num * price_num
where: 
  order-cost(3, 3.2) is 9.6
  order-cost(0, 2) is 0
end

#Task 3

fun discount-rate(drinks :: Number) -> Number:
  doc: "returns a specific number value (0-0.2) based on the number of drinks"
  if drinks < 5:
    0
  else if drinks <= 9:
    0.1
  else: 
    0.2
  end
where: 
  discount-rate(0) is 0
  discount-rate(4) is 0
  discount-rate(5) is 0.1
  discount-rate(9) is 0.1
  discount-rate(10) is 0.2
end

#Task 4
orders = table: customer, drinks, price
  row: "Amira", 2, 3.20
  row: "Ben", 6, 2.80
  row: "Chen", 12, 3.00
  row: "Dara", 1, 3.50
end

orders_cost = build-column(orders, "cost", lam(r): order-cost(r["drinks"], r["price"]) end)

orders_cost

orders_filtered = filter-with(orders_cost, lam(d): d["drinks"] >= 5 end)


#2 customers left after filtering

orders_filtered

#Task 5

drinks-list :: List<Number> = orders.get-column("drinks")

fun total-drinks-loop(lst :: List) -> Number:
  doc:"finds the total using a loop"
  block:
  var total_count = 0
    for each(n from lst):
  total_count := total_count + n
end
total_count
  end
where:
total-drinks-loop([list: ]) is 0
total-drinks-loop([list: 0, 2, 4]) is 6
end

fun total-drinks-fold(l :: List)-> Number:
doc:"finds the total using fold"
fold(lam(acc, n): acc + n end, 0, l)
where:
total-drinks-fold([list: ]) is 0
total-drinks-fold([list: 0, 2, 4]) is 6
end

check: 
total-drinks-loop(drinks-list) is 21
total-drinks-fold(drinks-list) is 21
end

#Task 6

data Order:
  | eat-in(drinks :: Number)
  | takeaway(drinks :: Number, own-cup :: Boolean)
end

fun cup-fee(o :: Order) ->Number:
doc: "calculates the cup fee based on dining choice and if they brought a cup"
  cases (Order) o:
| eat-in(d) => 0
| takeaway(d, c) =>
    if c == false:
      0.25 * d
    else:
      0
    end
  end
where:
cup-fee(eat-in(2)) is 0
cup-fee(takeaway(3, true)) is 0
cup-fee(takeaway(0, false)) is 0
cup-fee(eat-in(0)) is 0
cup-fee(takeaway(2, false)) is 0.5
end

fun total-drinks-rec(l :: List<Number>) -> Number:
doc: "adds up a list of drinks"
cases (List) l:
  | empty => 0
    | link(f, r) => f + total-drinks-rec(r)
  end
where: 
total-drinks-rec([list: ]) is 0
  total-drinks-rec([list: 2, 4, 3]) is 9
total-drinks-rec([list: 0, 0 , 0]) is 0
end