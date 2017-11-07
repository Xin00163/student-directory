def input_students
  puts "Please enter the name of the student, their cohort, their hobby, their
  country of birth and height seperated by ',' without any spaces\n"
  puts "To finish, just hit return twice"
  students = []
  name = STDIN.gets.strip

  while !name.empty? do
    s_directory = name.split(",")
    students << {:name => s_directory[0], :cohort => s_directory[1].to_sym,
                 :hobby => s_directory[2], :cob => s_directory[3], :height => s_directory[4]}
    puts "Now we have #{students.count} students"
    name = STDIN.gets.strip
  end
  # return the array of students
  students
end

def print_header
  puts "The students of D Academy"
  puts "---------------"
end

def print_student_list(students)
  students.each_with_index do |student, index|
    line_width = 30
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".ljust(line_width)
    puts "   Hobby: #{student[:hobby]}".ljust(line_width)
    puts "   COB: #{student[:cob]}".ljust(line_width)
    puts "   Height: #{student[:height]}".ljust(line_width)
  end
end

# # ex4. while method
# def print_while(students)
#   i = 0
#   while i < students.length
#     puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)"
#     i += 1
#   end
# end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#notes: students in the method input_students could only be used inside the method.
#Here is to create a students varibla to store the result of the method, so that it could be passed to others.
students = input_students
print_header
print_student_list(students)
print_footer(students)
