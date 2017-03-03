File.open(__FILE__, "r") do |this_file|     # A quine is a non-empty program that takes no input and whose output is only a copy of its own source code.
  puts this_file.read                    # __FILE__ refers the program to the currently executing file
end                                      # so the 'this_file' parameter becomes the currently executing file

def welcome             # Another method in our source code. This will be displayed along with the File.open method above.
  puts "Hello!"
end
