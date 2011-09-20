#!/usr/bin/ruby

require 'stop.rb'
require 'line.rb'

class ReadData
  @@lines = []
  @@stops = []
  
  def self.stops
    File.open("data/pysakit.txt", "r") do |file|
      while(line = file.gets)
        line = line.split
        @@stops << Stop.new(line[0].to_i, line[1].to_i, line[2].to_i, line[3].gsub(/_/, " "))
      end
    end
    @@stops
  end

  def self.lines
    files = `ls data/linja*.txt`
    files = files.split
  
    files.each do |file|
      File.open(file, "r") do |f|
        name = File.basename(f.path, ".txt").gsub(/linja/, "")
        timetable = []
        while(line = f.gets)
          line = line.split.compact
          stop = self.stops.find {|stop| stop.number == line[0].to_i}
          stop.transportations << name unless stop.transportations.include?(name)
          timetable << [stop, line[1].to_i] 
        end
        @@lines << Line.new(name, timetable)
      end
    end
    @@lines
  end
  
  def self.read
    populate_neighbours
    return self.stops, self.lines
  end
  
  def self.populate_neighbours    
    self.lines.each do |line|
      i = 0
      while(line.timetable[i+1])
        neighbours = line.timetable[i][0].neighbours
        next_stop = line.timetable[i+1][0]
        neighbours << next_stop.number unless neighbours.include?(next_stop.number)
        i = i+1
      end
    end
  end
end