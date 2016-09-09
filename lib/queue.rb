# require 'congress'
# require "net/http"

class Queue
  attr_reader :queue, :print_output

  def initialize
    @queue = []
    @print_output  = []
  #   @client = Attendee::Client.new()
  end

  def find(attribute, criteria)
    data = LoadFile.new
    data = data.loader("./event_attendees.csv")
    (@queue << data.find_all{|attendee| attendee.send(attribute) == criteria}).flatten!
    @queue
  end

  def printer(queue = @queue)
    @print_output << "\nLAST NAME".ljust(15) + "FIRST NAME".ljust(15) + "EMAIL".ljust(45) + "ZIPCODE".ljust(15) + "ADDRESS".ljust(40) + "CITY".ljust(30) + "STATE".ljust(10) \
    + "PHONE".ljust(15) + "DISTRICT\n"
    queue.each do |data|
      @print_output << "#{data.send(:last_name).ljust(15)}" + "#{data.send(:first_name).ljust(15)}" + "#{data.send(:email_address).ljust(45)}" \
     + "#{data.send(:zipcode).ljust(15)}" + "#{data.send(:street).ljust(40)}" + "#{data.send(:city).ljust(30)}" + "#{data.send(:state).ljust(10)}" + "#{data.send(:home_phone).ljust(15)}" \
     + "#{data.send(:district)}\n"
   end
    @print_output
 end

   def print_by (attribute)
      @queue = queue
      @sorted_output = queue.sort_by(&:last_name)
      printer(@sorted_output)
    end

   def count
     @queue.count
   end

   def clear_queue
     @queue = []
   end
 end
