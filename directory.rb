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
      puts
    when "2"
      center_align("Here are all the students in the directory...")
      puts
      show_students
    when "3"
      save_students
      puts
      center_align("Students' data has been saved in the students.csv file...")
    when "4"
      load_students
      puts
      center_align("Successfully loaded all the students' data...")
    when "9"
      center_align("Thank you, Bye...")
      puts
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def add_to_students_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
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
    add_to_students_array(name, cohort)

    puts "Now we have #{@students.count} students"
    puts "Please enter a name"
    name = STDIN.gets.strip
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')#parallel assignment
    add_to_students_array(name, cohort)
  end
  file.close
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


def try_load_students
  filename = ARGV.first# first argument from the command line
  return load_students if filename.nil?# load_students if no file is given
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
