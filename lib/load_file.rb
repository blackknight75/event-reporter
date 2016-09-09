require'csv'
# require 'sunlight/attendee'
require 'erb'
require 'pry'
require './lib/attendee'

# Sunlight::Congress.api_key = "be07785ba4704c4cade3417d1da5f621"

class LoadFile
  attr_reader :cleaned_data

  def initialize
    @cleaned_data = []
    @queue = Queue.new
  end

  def loader(filename="event_attendees.csv")
    contents = CSV.open filename, headers: true, header_converters: :symbol
    @cleaned_data = contents.map do |row|
      Attendee.new(row)
    end
  end

end
