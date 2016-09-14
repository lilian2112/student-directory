def input_students
  students = []
  additional_info = [:hobbies, :country_of_birth, :height]
  while true do
    new_hash = {}
    puts "Please enter the names of a student, to finish, just hit return twice"
    name = gets.delete "\n"
      if name == ''
        break
      end
      puts "Please enter the cohort of that student"
      cohort = gets.chomp.to_s
      if cohort == '' or nil
        cohort = "September"
      elsif ["january", "feburary", "march", "april", "may", "june", "july", "august", "september", "november", "december"].include? (cohort.downcase)
      else
        puts "Please enter a valid cohort, spell out the month, otherwise it will default to september"
        cohort = gets.chomp
        unless ["january", "feburary", "march", "april", "may", "june", "july", "august", "september", "november", "december"].include? (cohort.downcase)
         cohort = "September"
       end
      end
        new_hash[:name] = name
        new_hash[:cohort] = cohort.to_sym
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

def print_by_cohort(students)
  group_cohort = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october,:november, :december]
  group_cohort.each do |cohort|
    students.each do |student|
      if student[:cohort] == cohort
        puts "#{student[:name].center(12)} (#{student[:cohort]} cohort), their hobby is #{student[:hobbies]}, they were born in #{student[:country_of_birth]}, and they are #{student[:heigth]}cm tall"
end
end
end
end

=begin
this is an alternative sort method. but it only sorts cohorts alphabetically
def print(students)
  new_students = students.sort_by{|c| c[:cohort]}
  index = 0
  n = new_students.length
  new_students.each do |student|
  while index != n do
  student = new_students[index]
     puts "#{student[:name].center(12)} (#{student[:cohort]} cohort), their hobby is #{student[:hobbies]}, they were born in #{student[:country_of_birth]}, and they are #{student[:heigth]}cm tall."
  index += 1
end
end
end
=end


# finally, we print the total number of students
def print_footer(students)
  if students.count == 0
    puts "We currently have no students"
  elsif students.count <= 2
   puts "Overall, we have #{students.count} great student"
  else
   puts "Overall, we have #{students.count} great students"
 end
end


students = input_students
print_header
print_footer(students)
print_by_cohort(students)
