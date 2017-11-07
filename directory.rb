def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  puts "What is " + name + "'s hobby?"
  hobbies = gets.chomp
  puts "Which country was " + name + " born?"
  country_of_birth = gets.chomp
  puts "What is " + name + "'s height?"
  height = gets.chomp

  #while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies,
      country_of_birth: country_of_birth, height: height}
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

#ex2. print the students whose name begins with a specific letter
def print_first_letter(students)
  puts "What is the first letter?"
  first_letter = gets.chomp.downcase
  students.each_with_index do |student, index|
    if student[:name].length < 12 && student[:name][0].downcase == first_letter.downcase
    # ex1. add the index
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# ex4. while method
def print_while(students)
  i = 0
  while i < students.length
    puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)"
    puts "Hobby: #{students[i][:hobbies]}"
    puts "Birth country : #{students[i][:country_of_birth]}"
    puts "Height is #{students[i][:height]}"
    i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#notes: students in the method input_students could only be used inside the method.
#Here is to create a students varibla to store the result of the method, so that it could be passed to others.
students = input_students
print_header
print_first_letter(students)
print_while(students)
print_footer(students)
