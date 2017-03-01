def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # We create an empty array
  students = []
  # Get the first name
  name = gets.chomp
  # While the name variable is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # Get another name from the user
    name = gets.chomp
  end
  # Once the while loop has exited, return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print(students)
  students.each_with_index do |student, index|
    if student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end


# Now we have to actually call the methods to make anything happen
students = input_students
print_header
print(students)
print_footer(students)
