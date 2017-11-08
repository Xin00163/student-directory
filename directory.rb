def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty repeat this code
  while !name.empty? do
    puts "Please enter the students' cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = :not_decided
    end
    #add the student hash to the array
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    puts "Please enter a name"
    name = gets.chomp
  end
  students
end

def center_align(text)
  width = 100
  puts text.center(width)
end

def print_header
  center_align("The students of D Academy")
  center_align("---------------")
end

def print_student_list(students)
  if students.empty?
    center_align("Please enter one student.")
    puts
  end
  cohort_list =[:january,:february,:march,:april,:may,:june,:july,:august,
                :september,:october,:november,:december]
  students = students.sort_by {|student| cohort_list.index(student[:cohort])}
  students.each_with_index do |student, i|
    center_align("#{i + 1}. #{students[i][:name]} (cohort: #{students[i][:cohort]})")
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
  center_align("Overall, we have #{students.count} great students")
end

#notes: students in the method input_students could only be used inside the method.
#Here is to create a students varibla to store the result of the method, so that it could be passed to others.
students = input_students
print_header
print_student_list(students)
print_footer(students)
