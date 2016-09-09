require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/cleaner.rb'
require 'pry'

class CleanerTest < Minitest::Test

  def test_a_name_has_been_cleaned
    assert_equal "Jason", Cleaner.name("JAson")
    assert_equal "Barbara", Cleaner.name("Bar@bara")
    assert_equal "Michael", Cleaner.name("Mic Hael")
    assert_equal "Conrad", Cleaner.name("ConR@aD")
    assert_equal "Walters", Cleaner.name("Wal !ter$s")
    assert_equal "Fassbender", Cleaner.name("fAsSbEnDeR")
  end

  def test_a_email_has_been_cleaned
    assert_equal "jaco1228@gmail.com", Cleaner.email("ja$co%1228@gmail.com")
    assert_equal "winteriscoming@got.com", Cleaner.email("winter is coming @got.com")
    assert_equal "", Cleaner.email(nil)
  end

  def test_a_zipcode_has_been_cleaned
    assert_equal "02094", Cleaner.zipcode("2094")
    assert_equal "80109", Cleaner.zipcode("80109-1345")
    assert_equal "00000", Cleaner.zipcode("")
    assert_equal "00000", Cleaner.zipcode(nil)
  end

  def test_a_home_phone_has_been_cleaned
    assert_equal "3037049251", Cleaner.home_phone("303(*$&{(^&-704-9251")
    assert_equal "Invlaid Number", Cleaner.home_phone("434986303-704-9251")
    assert_equal "Invlaid Number", Cleaner.home_phone("1234")
    assert_equal "Invlaid Number", Cleaner.home_phone("")
  end

  def test_a_city_has_been_cleaned
    assert_equal "Boston", Cleaner.city("Bo@ston!")
    assert_equal "New York", Cleaner.city("NEw Yo$rk")
    assert_equal "Los Angeles", Cleaner.city("los angeles")
  end

  def test_an_address_has_been_cleaned
    assert_equal "147 15th St", Cleaner.address("147 15th st")
    assert_equal "31 Spooner St", Cleaner.address("31 spo@$oner ST!")
  end

  def test_a_state_has_been_cleaned
    assert_equal "NY", Cleaner.state("ny")
    assert_equal "MA", Cleaner.state("m a")
    assert_equal "CO", Cleaner.state("co@")
    assert_equal "CA", Cleaner.state("cal")
  end
end
