# require 'sunlight/attendee'
# Sunlight::Congress.api_key = "be07785ba4704c4cade3417d1da5f621"
require'csv'
require 'erb'

module Cleaner

  def self.name(name)
    name.to_s.capitalize.gsub(/[^'.-.a-zA-Z]/, "")
  end

  def self.email(email)
    email.to_s.gsub(/[^@.0-9a-zA-z]/, "")
  end

  def self.zipcode(zipcode)
    zipcode.to_s.gsub(/[^0-9]/, "").rjust(5, "0")[0..4]
  end

  def self.home_phone(home_phone)
    home_phone = home_phone.to_s.gsub(/[^0-9]/, "")
    if home_phone.length == 10
      home_phone
    elsif home_phone.length == 11 && home_phone[0] == "1"
      home_phone.slice!(0)
      home_phone
    else
      "Invlaid Number"
    end
  end

  def self.city(city)
    city.to_s.gsub(/[^a-zA-Z" "]/, "").split(" ").map(&:capitalize).join(" ")
  end

  def self.address(address)
    address.to_s.gsub(/[^a-zA-Z0-9" "]/, "").split(" ").map(&:capitalize).join(" ")
  end

  def self.state(state)
    state.to_s.gsub(/[^a-zA-Z]/,"").upcase[0..1]
  end
end
