def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = $stdin.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
  # get another name from the user
    name = $stdin.gets.chomp
    end
  # return the array of students
  students
end


def print_header(students)
  if students.count > 0
    puts "The students of my cohort at Makers Academy"
    puts "-------------"
  else
    puts "Whoops! Looks like we have no students :("
  end
end


def print(students)
  students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end


def print_footer(students)
  if students.count > 0
    puts "Overall, we have #{students.count} great students"
  end
end


students = input_students
print_header(students)
print(students)
print_footer(students)
