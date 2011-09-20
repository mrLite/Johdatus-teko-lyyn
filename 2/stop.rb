#!/usr/bin/ruby

class Stop
  include Comparable
  attr_accessor :number, :x, :y, :name, :neighbours, :transportations
  
  def <=>(comp)
    @number <=> comp.number
  end
  
  def initialize(number, x, y, name, neighbours=[], transportations=[])
    @number = number
    @x = x
    @y = y
    @name = name
    @neighbours = neighbours
    @transportations = transportations
  end
  
  def to_s
    "#{@number}\t#{@name}"
  end
end