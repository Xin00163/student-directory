#first we print the list of students
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Ales DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"]

puts "The students of D Academy"
puts "---------------"
students.each do |student|
  puts student
end
puts "Overall, we have #{students.count} great students"
