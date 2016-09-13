def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villain Academy"
  puts "-------------"
end

def print(student)
index = 0
letter = "a"
student.each_with_index do |student, index|
  if (student[:name].split "")[0].downcase == letter
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
   end
end
end



# finally, we print the total number of students
def print_footer(students)
puts "Overall, we have #{students.count} great students"
end


students = input_students
print_header
print(students)
print_footer(students)
