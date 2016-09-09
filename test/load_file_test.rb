require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/load_file.rb'
require 'pry'

class LoadFileTest < Minitest::Test

  def test_cleaned_data_exists_as_empty_array_when_instantianted
    load_file = LoadFile.new
    assert_equal [], load_file.cleaned_data
  end

  def test_it_can_load_a_default_file
    load_file = LoadFile.new
    load_file.loader()
    assert_equal false , load_file.cleaned_data.empty?
  end

  def test_it_can_load_a_given_file
    load_file = LoadFile.new
    load_file.loader("./event_attendees_small.csv")
    assert_equal false, load_file.cleaned_data.empty?
  end
end
