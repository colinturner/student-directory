def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return again"
  # We create an empty array
  students = []
  # Get the first name
  puts "The name, please:"
  name = gets.chomp
  puts "The country of origin, please:"
  country = gets.chomp
  # While the name variable is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    students << {name: name, country: country, cohort: :november}
    puts "Now we have #{students.count} students"
    # Get another name from the user
    puts "The name, please:"
    name = gets.chomp
    puts "The country of origin, please:"
    country = gets.chomp
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
      puts "#{index + 1}. #{student[:name]}, from #{student[:country]} (#{student[:cohort]} cohort)".center(60)
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
