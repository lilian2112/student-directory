def input_students
  students = []
  additional_info = [:hobbies, :country_of_birth, :height, :relationship_status]
  while true do
    new_hash = {}
    puts "Please enter the names of a student"
    puts "To finish, just hit return twice"
    name = gets.chomp
      if name == ''
        break
      end
        new_hash[:name] = name
        new_hash[:cohort] = :september
        additional_info.each do |info|
          puts "Please enter #{info.to_s} for #{name}."
          information = gets.chomp
          new_hash[info] = information
      end
      students << new_hash
  end
  students
end


def print_header
  puts "The students of Villain Academy"
  puts "-------------"
end

def print(students)
  index = 0
  n = students.length
  students.each do |student|
  while index != n do
  student = students[index]
     puts "#{student[:name]} (#{student[:cohort]} cohort), their hobby is #{student[:hobbies]}, they were born in #{student[:country_of_birth]}, and they are #{student[:heigth]}cm tall"
  index += 1
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
