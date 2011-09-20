#!/usr/bin/ruby

class Line
  include Comparable
  attr_accessor :name, :timetable
  
  def <=>(comp)
    @name <=> comp.name
  end
  
  def initialize(name, timetable=[])
    @name = name
    @timetable = timetable
  end
end