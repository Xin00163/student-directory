@students = []
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
    exit # this will cause the program to terminate
    else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty repeat this code
  while !name.empty? do
    puts "Please enter the students' cohort"
    cohort = STDIN.gets.chomp
    if cohort.empty?
      cohort = :not_decided
    end
    #add the student hash to the array
    @students << {name: name, cohort: cohort.to_sym}
    if @students.count > 1
    puts "Now we have #{@students.count} students"
    end
    if @students.count == 1
    puts "Now we have #{@students.count} student"
    end
    puts "Please enter a name"
    name = STDIN.gets.strip
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')#parallel assignment
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil?# get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

def center_align(text)
  width = 100
  puts text.center(width)
end

def print_header
  center_align("The students of D Academy")
  center_align("---------------")
end

def print_student_list
  if @students.empty?
    center_align("Please enter one student.")
    puts
  end
  # cohort_list =[:january,:february,:march,:april,:may,:june,:july,:august,
  #               :september,:october,:november,:december]
  # @students = @students.sort_by {|student| cohort_list.index(student[:cohort])}
  @students.each_with_index do |student, i|
    center_align("#{i + 1}. #{@students[i][:name]} (cohort: #{@students[i][:cohort]})")
  end
end



def print_footer
  center_align("Overall, we have #{@students.count} great students")
end


try_load_students
interactive_menu()
