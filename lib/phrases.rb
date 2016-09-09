module Phrases

  def self.help
    puts "Outputs a listing of available individual commands."
  end

  def self.queue_count
    puts "Outputs how many records are in the current queue."
  end

  def self.queue_clear
    puts "Empties the current queue."
  end

  def self.queue_district
    puts "If there is less than 10 entries in the queue this command will \n
    use the Sunlight API to get Congressional district information for each entry."
  end

  def self.queue_print
    puts "Prints out a tab delimimted data table with a header row."
  end

  def self.queue_print_by_attribute
    puts "Prints the data table sorted by the specified attribute."
  end

  def self.queue_save_to_filename
    puts "Export the current queue to the specefied filename as a CSV."
  end

  def self.queue_export_html_to_filename
    puts "Export the current queue to the specfied filename as a valid HTML file."
  end

  def self.find_attribute_criteria
    puts "Load the queue with all records matching the criteria for the given attribute."
  end
end
