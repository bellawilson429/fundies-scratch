use context dcic2024

tems = tablre: item :: String, x-coordinate :: Number, y-coordinate :: Number
  row: "sword of dawn", 23, -87
  row: "healing potion", -45, 12
  row: "dragon shield", 78, -56
  row: "magic staff", -9, 64
end
    
fun move-1(num :: Number) -> Number:
      
      doc: "subtracts 1 from the input"
      num - 1
    where: 
      move-1(10) is 9
      move-1(-1) is -2
      move-1(3.5) is 2.5
    end
    
moved-items = transform-column(items, "x-coordinate", move-1)

moved-items


fun calc-distance(r :: Row) -> Number:
  doc: "does distance to origin from 'x-coordinate' and 'y-coordinate'"
  
  num-sqrt(num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"]))
    
    where:
    calc-distance(items.row-n(0)) is-roughly num-sqrt(num-sqr(23) + num-sqr(-87))
    
  end

items-with-dist = build-column(items, "distance", calc-distance)

items-with-dist