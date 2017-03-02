@students = []

def input_students
  puts "Please enter the names of the students"
  puts "Or press return again to finish"

  puts "The name, please:"
  name = gets.delete("\n")

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

    @students << {name: name, cohort: cohort}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
  # Get another name from the user
    puts "The next name, please (or press RETURN again to finish):"
    name = gets.chomp

  end
  # Once the while loop has exited, return the array of students
  @students
end



def print_header
  puts "The students of Villains Academy"
  puts "------------"
end



def print
  cohorts = @students.map {|student| student[:cohort]}   # Produce a new array, containing each cohort value from each hash in the students array
    cohorts.uniq.each do |month|     # Ignore duplicate values for the months collected into the cohorts array in the line above
      puts "#{month} cohort"    # puts those unique (non-duplicated) months, along with the word 'cohort' next to the month
      @students.each do |student|   # for each hash in the students array,
        if student[:cohort] == month  # if the value stored under the :cohort key is precisely equal to the month
          puts "#{student[:name]}"   # then puts the student's name value
        end
      end
    end
end



def print_footer
  if @students.count < 1
    puts "Whoops! Looks like we have no students! :("
  elsif @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end



def interactive_menu

  loop do
    print_menu
    selection = gets.chomp

    case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print
  print_footer
end

interactive_menu
