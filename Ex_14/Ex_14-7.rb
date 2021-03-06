require 'csv'
@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection    # use when/then syntax for brevity
  when "1" then input_students
  when "2" then show_students
  when "3" then save_students
  when "4" then load_students
  when "9" then puts "Goodbye!"; exit # this will cause the program to terminate
  else puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_students(name)
    if @students.count == 1
      singular = ""
    else singular = "s"
    end
    puts "#{name} was successfully added to the cohort. Now we have #{@students.count} student#{singular}"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  singular = "s"
  puts @students.count
  if @students.count < 1
    puts "Whoops, looks like we have no students! :("
  elsif @students.count == 1
    singular = ""
  else
    singular = "s"
  end
  puts "Overall, we have #{@students.count} great student#{singular}."
end

def save_students
  # open the file for writing
  puts "Please enter a name for the file:"
  filename = STDIN.gets.chomp
  CSV.open(filename, "w") do |csv|
  # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
    end
  end
  puts "Success! The list of students by cohort was saved to the file #{filename}"
end

def load_students
  puts "Please enter a file name to load: "
  filename = STDIN.gets.chomp || filename = "students.csv"
  CSV.foreach(filename, "r") do |name, cohort|
    @students << {name: name, cohort: cohort.to_sym}
  end
  puts "Looking good! The list of students has been loaded from #{filename}"
end

def try_load_students
  filename = ARGV.first || filename = "students.csv"# first argument from the command line OR default to students.csv file if none other given
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def add_students(name, cohort = :november)             # new method to avoid repetition. This code adds name and cohort info
  @students << {name: name, cohort: cohort.to_sym}     # as hashes to the students array.
end

# try_load_students
interactive_menu
