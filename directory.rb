def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of D Academy"
  puts "---------------"
end

# ex2. print the students whose name begins with a specific letter
def print_first_letter(students)
  puts "What is the first letter?"
  first_letter = gets.chomp.downcase
  students.each_with_index do |student, index|
    if student[:name][0].downcase == first_letter.downcase
    # ex1. add the index
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students #store the results of the method in the variable called students?
print_header
print_first_letter(students)
print_footer(students)
