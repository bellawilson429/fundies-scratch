use context starter2024
import file("lab2-support.arr") as support


#testing1

#support.encryptor1("Hello")


#support.encryptor1("HELLO")

#support.encryptor1("Hello World!")

#encoder1

fun myencoder1(raw_input :: String) -> String:
  
  doc: "returns the input concatenated 5 times to itself"
 
  string-repeat(raw_input, 5)
  
where: myencoder1("hello") is "hellohellohellohellohello"
  
end



#check for encoder1

myencoder1("Hello") 

#testing 2

#support.encryptor2("hot cross buns")

#support.encryptor2("FREEPALESTINE")  

#encoder2

fun myencoder2(raw_input :: String) -> String:
  
  doc: "returns the first four characters of the input and truncates the rest of the String"
  
  string-substring(raw_input, 0, 4)
  
where: myencoder2("hello") is "hell"
  
end 

#check for encoder2

myencoder2("hellohello")

#testing 3

#| support.encryptor3("oh say can you see")

support.encryptor3("one two three four five six seven eight nine ten")

support.encryptor3("niffum")

support.encryptor3("nineteen-eighty-four")

support.encryptor3("23bananas56")
support.encryptor3("semicolons;suck:")

support.encryptor3("YELLING!!!!")
support.encryptor3("😭😳")

support.encryptor3("!@#$%^&*()+_-=")

support.encryptor3("im confuzzled???")

support.encryptor3("I love computer science")

|#

support.encryptor3("I love dogs.")

#finally!

#encoder3

fun myencoder3(raw_input :: String) -> String:
  
  doc: "replaces the punctuation period with an exclamation mark in the String"
  
  string-replace(raw_input,".", "!")
  
where: myencoder3("I love my dog.") is "I love my dog!"
  
end 

#check for encoder3

myencoder3("Hello.")

#testng 4

support.encryptor4("Hello!")

#encoder4

fun myencoder4(raw_input :: String) -> String:
  
  doc: "takes the first four characters and repeats this phrase 5 times"
  
  s = string-substring(raw_input, 0, 4)
  
  string-repeat(s, 5)
  
where: myencoder4("Hello") is "HellHellHellHellHell"
  
end 

#check for encoder 4

myencoder4("hot cross buns")

#testing 5

support.encryptor5("Hello!")

support.encryptor5("old mcdonald had a farm; e i e i o a u")

support.encryptor5("HOt CrOss BUNs")

#encoder5

fun myencoder5(raw_input :: String) -> String:
  
  doc: "replaces the vowels in the string with the subsequent letter in the alphabet"
  block:
 
    s1 = string-replace(raw_input, "a", "b")
    s2 = string-replace(s1, "A", "B")
    s3 = string-replace(s2, "e", "f")
    s4 = string-replace(s3, "E", "F")
    s5 = string-replace(s4, "i", "j")
    s6 = string-replace(s5, "I", "J")
    s7 = string-replace(s6, "O", "P")
    s8 = string-replace(s7, "o", "p") 
    s9 = string-replace(s8, "U", "V")
    s10 = string-replace(s9, "u", "v")
    
    s10
    
end
  
  where: myencoder5("I Slaughtered Them Like Animals") is "J Slbvghtfrfd Thfm Ljkf Bnjmbls"
  
end

#checking for encoder 5

myencoder5("hot cross buns! aeiouAEIOU")

#testing 6

support.encryptor6("Hello World!")

support.encryptor6("BLACKBERRY. BLUEBERRY? Strawberry!")

#encoder6

fun myencoder6(raw_input :: String) -> String:
  
  doc: "takes the first four characters and repeats this phrase 5 times"
 
  
   s = string-tolower(raw_input)
    string-replace(s, "r", "")
  
where: myencoder6("Hello World!") is "hello wold!"
  
end 

#checking for encoder 6

myencoder6("release the Epstein files and jail the Cornell 7")

#testing 7

support.encryptor7("Hello World!")
support.encryptor7("hi")

#encoder7

fun myencoder7(raw_input :: String) -> Number:
  doc: "returns the number of characters in the string input"
  
  string-length(raw_input)
  
where: myencoder7("Hello World") is 11
  
end

#checking for encoder 7
myencoder7("supercalifragilisticexpialidocious")

#testing 8

support.encryptor8("Hello! 67")

support.encryptor8("donut go in")

#encoder8 

fun myencoder8(raw_input :: String) -> String: 
  
  doc: "concatenates 3 exclamation marks and repeats this new expression 3 times"
  
  s_new = string-append(raw_input, "!!!")
  string-repeat(s_new, 3)
  
where: myencoder8("lemon") is "lemon!!!lemon!!!lemon!!!"
end

#checking for encoder 8 
myencoder8("Get out")
  
#testing 9

support.encryptor9("mushroom")
support.encryptor9("!lmao!")

#encoder 9

fun myencoder9(raw_input :: String) -> Number: 
  doc: "takes the first character in the string inputed and returns the adjacent unicode that corresponds to the character"
  
  first_character = string-substring(raw_input, 0, 1)
  
  string-to-code-point(first_character)
  
where: myencoder9("telephone") is 116
  
end

#checking for encoder9

myencoder9("mystical")

#testing 10

support.encryptor10("Hello World!")
support.encryptor10("AAAAAHh")

fun myencoder10(raw_input :: String) -> String:
  doc: "Takes the first four characters, and replaces the vowels with the subsequent letter, then repeats this expression 5 times"
  block: 
    
    s = string-substring(raw_input, 0, 4)
    s_new = string-to-lower(s)
    
    
  s1 = string-replace(s_new, "a", "b")
  s2 = string-replace(s1, "e", "f")
  s3 = string-replace(s2, "i", "j")
  s4 = string-replace(s3, "o", "p") 
  s5 = string-replace(s4, "u", "v")
  
  
    string-repeat(s5, 5)
    
  end
  
    where: myencoder10("hello") is "hfllhfllhfllhfllhfll"
  
end