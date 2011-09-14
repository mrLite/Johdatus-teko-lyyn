#!/usr/bin/ruby -w

class Queue
  def initialize
    @queue = List.new
  end
  
  def enqueue(node)
    @queue.add(node)
  end
  alias_method :add, :enqueue
  
  def dequeue
    @queue.remove(0)
  end
  alias_method :remove, :dequeue
  
  def size
    @queue.arr.size
  end
  
  def to_s
    str = "("
    0.upto(@queue.arr.size-1) {|n| str << " "+@queue.arr[n].to_s } unless @queue.arr == nil
    str << " )"
    str
  end
end

class Stack  
  def initialize
    @stack = List.new
  end
  
  def push(node)
    @stack.add(node)
  end
  alias_method :add, :push
  
  def pop
    @stack.remove(-1)
  end
  alias_method :remove, :pop
  
  def size
    @stack.arr.size
  end
  
  def to_s
    str = "("
    (@stack.arr.size-1).downto(0) {|n| str << " "+@stack.arr[n].to_s } unless @stack.arr == nil
    str << " )"
    str
  end
end

class List
  attr_accessor :arr

  def initialize(arr = [])
    @arr = arr
  end

  def add(node)
    @arr << node
  end

  def remove(position)
    @arr.delete_at(position)
  end
end