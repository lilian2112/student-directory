def interactive_menu
@students = []
loop do
  print_menu
  process(gets.chomp)
end
end

def process(selection )
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of sudents.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_by_cohort
  print_footer
end


def input_students
  additional_info = [:hobbies, :country_of_birth, :height]
  while true do
    new_hash = {}
    puts "Please enter the names of a student, to finish, just hit return again"
    name = gets.delete "\n"
      if name == ''
        break
      end
      puts "Please enter the cohort of that student"
      cohort = gets.chomp.to_s
      if cohort == '' or nil
        cohort = "september"
      elsif ["january", "february", "march", "april", "may", "june", "july", "august", "september", "november", "december"].include? (cohort.downcase)
      else
        puts "Please enter a valid cohort, spell out the month, otherwise it will default to september"
        cohort = gets.chomp
        unless ["january", "february", "march", "april", "may", "june", "july", "august", "september", "november", "december"].include? (cohort.downcase)
         cohort = "september"
       end
      end
        new_hash[:name] = name
        new_hash[:cohort] = cohort.to_sym
        additional_info.each do |info|
          puts "Please enter #{info.to_s} for #{name}."
          information = gets.chomp
          new_hash[info] = information
      end
      @students << new_hash
  end
  @students
end

def save_students
  #open file for writing
  file = File.open("students.csv", "w")
  # itterate over array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


def print_header
  puts "The students of Villain Academy"
  puts "-------------"
end

def print_by_cohort
  group_cohort = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october,:november, :december]
  group_cohort.each do |cohort|
    @students.each do |student|
      if student[:cohort] == cohort
        puts "#{student[:name].center(12)}, (#{student[:cohort]} cohort), their hobby is #{student[:hobbies]}, they were born in #{student[:country_of_birth]}, and they are #{student[:heigth]}cm tall"
end
end
end
end



# finally, we print the total number of students
def print_footer
  if @students.count == 0
    puts "We currently have no students"
  elsif @students.count <= 1
   puts "Overall, we have #{@students.count} great student"
  else
   puts "Overall, we have #{@students.count} great students"
 end
end


interactive_menu
