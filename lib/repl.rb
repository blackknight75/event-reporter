require './lib/phrases'
require './lib/queue'
require './lib/load_file'
require 'pry'



class Repl
  include Phrases

queue = Queue.new
file = LoadFile.new
lines = "-------------------------------------------------------"
input = ""

puts lines
puts "This is Event Reporter!"
puts lines

  until input == "quit"
    puts "Welcome to Event Reporter! \n To load a file please type load. \n To see possible commands please type options. \n To exit type quit."
    puts lines
    input = gets.chomp.downcase
    if input == "load"
      file.loader
      puts lines
      # binding.pry
    elsif input == "find"
      puts "Type Attribute"
      input_1 = gets.chomp.downcase
      puts "Type Criteria"
      input_2 = gets.chomp.capitalize
      queue.find(input_1, input_2)
      puts lines
    elsif input == "queue count"
      count = queue.count
      puts "The number of items in your queue is #{count}."
      puts lines
    elsif input == "queue district"
      puts "Type zipcode"
      input_3 = gets.chomp
      district = queue.district(input_3)
      puts district
      puts lines
    elsif input == "queue print"
      output = queue.printer
      puts output
      puts lines
    elsif input ==  "help command"
      Phrases.help_command
      puts lines
    elsif input == "help queue count"
      Phrases.queue_count
      puts lines
    elsif input == "help queue clear"
      Phrases.queue_clear
      puts lines
    elsif input == "help queue district"
      Phrases.queue_district
      puts lines
    elsif input == "help queue print"
      Phrases.queue_print
      puts lines
    elsif input == "help queue print by attribute"
      Phrases.queue_print_by_attribute
      puts lines
    elsif input == "help queue save to filename"
      Phrases.queue_save_to_filename
      puts lines
    elsif input == "help queue export to html"
      Phrases.queue_export_html_to_filename
      puts lines
    elsif input == "help find by attribute"
      Phrases.find_attribute_criteria
      puts lines
    elsif input == "options"
      puts "Your possible commands are:
      load <filename>
      find <attribute here> <criteria here>
      queue count
      queue clear
      queue district
      queue print
      queue print by <attribute here>
      queue save to <filename here>
      queue export html <filename here>
      help <enter command name here>
      quit"
      puts lines
    elsif input == "quit"
      puts "Have a nice day!"
    else
      puts "Unrecognized command please try again."
      puts lines
    end
  end
end
