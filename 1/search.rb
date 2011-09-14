#!/usr/bin/ruby -w
require 'list.rb'

def dfs(start_node, goal=nil)
  search(start_node, goal, Stack.new)
end

def bfs(start_node, goal=nil)
  search(start_node, goal, Queue.new)
end

def search(start_node, goal, list_type)
  list = list_type
  list.add start_node
  start_node.color = "grey"
  
  while list.size > 0
    node = list.remove
    node.color = "black"
    puts node
    return node if node == goal
    node.neighbours.each do |n|
      if n.color == "white"
        n.color = "grey"
        n.predecessor = node
        list.add n
      end
    end
  end
  
  return nil
end

def route(start, goal)
  puts "Reitti #{start.value} -> #{goal.value}"
  route = Stack.new
  node = goal
  begin
    route.push node
    node = node.predecessor
  end while node
  while route.size > 0
    puts route.pop
  end
end