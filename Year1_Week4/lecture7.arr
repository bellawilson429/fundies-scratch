use context dcic2024
include csv


orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

fun is-high-value(o :: Row) -> Boolean:
  o["amount"] >= 8.0
where: 
  is-high-value(orders.row-n(2)) is true
  is-high-value(orders.row-n(4)) is false
end

new-high-orders = filter-with(orders, is-high-value)

high-value-orders = table: time, amount
  row: "08:00", 10.50
  row: "10:15", 8.00
end

check: 
  new-high-orders is high-value-orders
end

filter-with(orders, lam(o): o["amount"] >= 8.0 end)

#order by

order-by(orders, "amount", true) #ascending

order-by(orders, "amount", false) #descending

#class exercises

fun is-morning(time :: Column) -> Boolean:
  doc: "given a time, this function checks if it's morning, meaning this time is before noon"
  
  o["time"] <= "12:00"
  
where: 
  is-morning(o[
  
  