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

# print students
puts "The students of Villain Academy"
puts "-------------"
students.each do |student|
  puts student
end
# finally, we print the total number of students
puts "Overall, we have #{students.count} great students"
