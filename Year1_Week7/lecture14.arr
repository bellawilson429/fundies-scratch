#|
   fun f(fp: Footprint) -> ...
   cases (Footprint) fp:
   | split(name, left, right) => ... f(left) .. f(right) ...
   | activity(name, kg) => ...
|#

data Footprint: 
  | split(name :: String, left :: Footprint, right :: Footprint)
  | activity(name :: String, kg :: Number)
end

car = activity("car", 900)
flights = activity("flight", 1500)
heating = activity("heating", 1100)

travel = split("travel", car, flights)
my-footprint = split("my year", travel, heating)

#total co2?

fun total-co2(fp :: Footprint) -> Number:
  cases (Footprint) fp:
    | split(name, left, right) => total-co2(left) + total-co2(right)
    | activity(name, kg) => kg
  end
where:
  total-co2(car) is 900
  total-co2(my-footprint) is 3500
end

#how many splits?

fun count-splits(fp :: Footprint) -> Number:
  cases (Footprint) fp:
    | split(name, left, right) => 1 + count-splits(left) + count-splits(right)
    | activity(name, kg) => 0
  end
where: 
  count-splits(car) is 0
  count-splits(my-footprint) is 2
  count-splits(travel) is 1
end

fun total-co2-left(fp :: Footprint) -> Number: 
  cases(Footprint) fp:
    | split(name, left, right) => total-co2-left(left)
    | activity(name, kg) => kg
  end
end

check "only the left-most activity is counted":
  total-co2-left(car) is 900
  total-co2-left(my-footprint) is 900
end

#class exercise 1

fun count-streams(fp :: Footprint) -> Number:
  cases (Footprint) fp:
    | split(name, left, right) => count-streams(left) + count-streams(right) + 2
    | activity(kg, name) => 0
  end
where: 
  count-streams(my-footprint) is 4
  count-streams(travel) is 2
  count-streams(car) is 0
end

#class exercise 2
data River:
  | merge(width :: Number, left :: River, right :: River)
  | stream(flow-rate :: Number)
end

# Example: A small river network
stream-a = stream(5)
stream-b = stream(3)
stream-c = stream(8)

merge-1 = merge(12, stream-a, stream-b)
main-river = merge(15, merge-1, stream-c)


fun max-width(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => num-max(width, num-max(max-width(left), max-width(right)))
    | stream(flow-rate) => 0
   end
where:
  max-width(merge-1) is 12
  max-width(main-river) is 15
  max-width(stream-a) is 0
end

#class exercise 3
fun cap-flow(r :: River) -> River:
  cases (River) r: 
      split(width, left, right) => 