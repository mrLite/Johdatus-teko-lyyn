#!usr/bin/ruby -w

# cl = Cannibals on the left side, ml = Missionaries on the left side, etc.
class Node
  include Comparable
  attr_accessor :cl, :ml, :cr, :mr, :boat, :color, :predecessor, :neighbours
  
  def <=>(comp)
    [@cl,@ml,@cr,@mr,@boat] <=> [comp.cl,comp.ml,comp.cr,comp.mr,comp.boat]
  end
  
  def initialize(cl=3,ml=3,cr=0,mr=0,boat="left",color="white",predecessor=nil,neighbours=[])
    @cl = cl
    @ml = ml
    @cr = cr
    @mr = mr
    @boat = boat
    @color = color
    @predecessor = predecessor
    @neighbours = neighbours
  end
  
  def to_s
    "(#{@cl},#{@ml},#{@cr},#{@mr},#{@boat})"
  end
  
  def to_a
    boat_left = (@boat == "left") ? true : false
    [[@cl, @ml], [@cr, @mr], boat_left]
  end
end