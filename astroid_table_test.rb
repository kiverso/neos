require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'near_earth_objects'
require_relative 'astroid_table'

class AstroidTableTest < Minitest::Test
  def setup
    @results = NearEarthObjects.new('2019-03-30').formatted_astroid_data
    @table = AstroidTable.new(@results)
  end

  def test_it_exists
    assert_instance_of AstroidTable, @table
  end

  def test_it_can_get_column_data
    expected = {:name=>{:label=>"Name", :width=>17},
                :diameter=>{:label=>"Diameter", :width=>8},
                :miss_distance=>{:label=>"Missed The Earth By:", :width=>20}}
  
    assert_equal expected, @table.column_data
  end

  def test_it_can_get_header
    expected = "| Name              | Diameter | Missed The Earth By: |"
    assert_equal expected, @table.header
  end

  def test_it_can_get_divider
    expected = "+-------------------+----------+----------------------+"
    assert_equal expected, @table.divider
  end
end
