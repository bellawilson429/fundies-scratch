use context dcic2024
data Post:
    post(username :: String, caption :: String, likes :: Number, shares :: Number)
end

post-1 = post("@climate_now", "Artic sea ice hits a record low", 1250, 340)
post-2 = post("@cityfarm", "Our rooftop garden this week", 85, 4)
post-3 = post("@nu_london", "Welcome to week 6!", 410, 12)

feed :: List<Post> = [list: post-1, post-2, post-3]

post-1.likes
post-1.username
feed.length()

#funcitons over a Post

fun engagement(p :: Post) -> Number:
  doc: "likes plus shares for a post, sum of all engagement metrics"
  p.likes + p.shares
where:
  engagement(post-1) is 1590
  engagement(post("@hello", "hello this is James Bond", 0, 0)) is 0
end

fun is-viral(p :: Post) -> Boolean:
  doc: "ture when a post has more than 1000 likes"
  p.likes > 1000
where: 
  is-viral(post-1) is true
  is-viral(post-2) is false
  is-viral(post("@lebron", "Lebron Jamessss", 1000, 50)) is false
end

#conditional data

#priority: variants with no fields

data Priority:
  | low
  | medium
  | high
end

task-1-priority = low
task-2-priority = medium 
task-3-priority = high

check:
  is-Priority(task-1-priority) is true
  is-low(task-1-priority) is true
  is-medium(task-2-priority) is true
end
#task: variants with fields
data Task:
  | task(description :: String, priority :: Priority)
  | note(description :: String)
end
task-1 = task("Buy Groceries", high)
task-2 = task("Pay council tax", high)
note-1 = note("PDI exam on Oct 30th")

task-1.priority
note-1.description
check:
is-task(task-1) is true
is-note(task-1) is false
end

#describe
fun describe(t :: Task) -> String:
  cases (Task) t:
    | task(d, p) => "TASK: " + d
    | note(d) => "NOTE: " + d
  end
end
  
  #The task(d, p) pattern must have one name per field, in order. the note branch has one name because note has one field

describe(task-1)
describe(note-1)

fun is-urgent(t :: Task) -> Boolean: 
  doc: "true for a task with high priority; notes are never urgent"
  cases (Task) t: 
    | task(d, p ) => is-high(p)
    | else => false
  end
where: 
  is-urgent(task-2) is true
  is-urgent(task-1) is true
  is-urgent(note-1) is false
end

#variant with no branch

fun describe-again(t :: Task) -> String: 
  cases (Task) t: 
    | task(d, p) => "TASK: " + d
  end
end

describe-again(task-1)
#describe-again(note-1)

data Temperature:
    degrees(celsius :: Number, fahrenheit :: Number, kelvin :: Number)
end

