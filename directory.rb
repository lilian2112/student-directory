@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def interactive_menu
loop do
  print_menu
  process(STDIN.gets.chomp)
end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    ask_file
    save_students
  when "4"
    ask_file
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    while !name.empty? do
      hash = {name: name, cohort: :november}
      add_info(hash)
      puts "Now we have #{@students.count} students"
      name = STDIN.gets.chomp
    end
  end

def show_students
  print_header
  print_student_list
  print_footer
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    hash = {name: name, cohort: cohort.to_sym}
    add_info(hash)
    end
    puts "Students have been loaded successfully"
    file.close
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "Students have been saved successfully"
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
     filename = "students.csv"
   end
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def ask_file
  puts "please specify a filename, or hit return to use the default"
  file = STDIN.gets.chomp
  if file.empty?
    file = @File
  end
end

def add_info hash
    @students << hash
end


def print_header
  puts "The students of Villain Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end


def print_footer
  if @students == []
    puts "We currently have no students"
  elsif @students.count == 1
   puts "Overall, we have 1 great student"
  else
   puts "Overall, we have #{@students.count} great students"
 end
end

try_load_students
interactive_menu
