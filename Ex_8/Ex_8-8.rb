def input_students
  puts "Please enter the names of the students"
  puts "Or press return again to finish"
  # We create an empty array
  students = []

  puts "The name, please:"
  name = gets.chomp

# Until the name variable is empty, repeat this code
  until name.empty? do
  # Add the student hash to the array
    puts "The cohort, please:"
    cohort = gets.chomp
      if cohort.empty?
        cohort = :november
      else
        cohort = cohort.downcase.to_sym
      end

    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
  # Get another name from the user
    puts "The next name, please (or press RETURN again to finish):"
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
