#!/usr/bin/ruby -w

class GraphNode
  include Comparable
  attr_accessor :value, :neighbours, :color, :predecessor
  
  def <=>(comp)
    value <=> comp.value
  end
  
  def initialize(value=nil,neighbours=[],color="white",predecessor=nil)
    @value = value
    @neighbours = neighbours
    @color = color
    @predecessor = predecessor
  end
  
  def reset
    @color = "white"
    @predecessor = nil
  end
  
  def to_s
    "(value: #{@value}, color: #{@color}, predecessor: #{@predecessor ? @predecessor.value : 'nil'})"
  end
end