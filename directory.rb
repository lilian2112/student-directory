# array of students
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratchet",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",]

def print_header
  puts "The students of Villain Academy"
  puts "-------------"
end

def print(names)
names.each do |name|
  puts name
end
end
# finally, we print the total number of students
def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)
