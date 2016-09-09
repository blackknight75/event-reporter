require './lib/cleaner'
require './lib/load_file'


class Attendee
  include Cleaner
  attr_reader :first_name, :last_name, :email_address, :home_phone, :street, :zipcode, :city, :state, :district

  def initialize(row)
    @first_name = Cleaner.name(row[:first_name])
    @last_name = Cleaner.name(row[:last_name])
    @email_address = Cleaner.email(row[:email_address])
    @home_phone = Cleaner.home_phone(row[:homephone])
    @street = Cleaner.address(row[:street])
    @zipcode = Cleaner.zipcode(row[:zipcode])
    @city = Cleaner.city(row[:city])
    @state = Cleaner.state(row[:state])
    @district = Cleaner.state(row[:district])
  end
end
