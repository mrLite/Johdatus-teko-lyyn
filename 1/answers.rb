#!/usr/bin/ruby -w
require 'list.rb'
require 'node.rb'
require 'search.rb'
require 'graph_node.rb'

puts "Johdatus tekoälyyn, laskarit 1."

puts "\nTEHTÄVÄ 2 BEGIN"
puts <<-eos
CAPTCHA pyrkii erottamaan ihmisen ja mahdollisen roskapostittajabotin esittämällä käyttäjälle
jollain tavalla vääristetyn kuvan, josta ihmisaivojen hahmontunnistus kykenee erottamaan
kirjaimia tai numeroita, mutta tietokoneen kuvantunnistus ei.
CAPTCHA on Turingin testi, jossa testaaja on palveluntarjoaja ja testattava palvelun käyttäjä.
Tämä ei muutu, vaikka käyttäjä olisikin botti joka suorittaa varsinaisen kuvantunnistustehtävän
ihmistyövoiman avulla.
eos
puts "END TEHTÄVÄ 2"

puts "\nTEHTÄVÄ 3 BEGIN"
puts <<-eos
Syvyyssuuntainen haku, solmulistan sisältö:
( A )
( D  C  B )
( F  C  B )
( E  C  B )
( C B )
( B )
( )

Leveyssuuntainen haku, solmulistan sisältö:
( A )
( B  C  D )
( C  D )
( D  F )
( F )
( E )
( )
eos
puts "END TEHTÄVÄ 3"

puts "\nTEHTÄVÄ 4 BEGIN"
puts <<-eos
(kann. vas., läh. vas., kann. oik., läh. oik., veneen sijainti)
<lähtötila> -> sallitut tilat (jotka eivät johda lähetyssaarnaajien kuolemaan)
Tilat, jotka ovat jo aiemmin esiintyneet, merkitään tähdellä (*)

(3,3,0,0,L) -> (2,3,1,0,R) (1,3,2,0,R) (2,2,1,1,R)

(2,3,1,0,R) -> (3,3,0,0,L)*
(1,3,2,0,R) -> (3,3,0,0,L)* (2,3,1,0,L)
(2,2,1,1,R) -> (3,3,0,0,L)* (2,3,1,0,L)

(2,3,1,0,L) -> (2,2,1,1,R)* (1,3,2,0,R)* (0,3,3,0,R)

(0,3,3,0,R) -> (2,3,1,0,L)* (1,3,2,0,L)

(1,3,2,0,L) -> (0,3,3,0,R)* (1,1,2,2,R)

(1,1,2,2,R) -> (1,3,2,0,L)* (2,2,1,1,L)

(2,2,1,1,L) -> (1,1,2,2,R)* (2,0,1,3,R)

(2,0,1,3,R) -> (2,2,1,1,L)* (3,0,0,3,L)

(3,0,0,3,L) -> (2,0,1,3,R)* (1,0,2,3,R)

(1,0,2,3,R) -> (3,0,0,3,L)* (2,0,1,3,L) (1,1,2,2,L)

(2,0,1,3,L) -> (1,0,2,3,R)* (0,0,3,3,R)
(1,1,2,2,L) -> (1,0,2,3,R)* (0,0,3,3,R)

Eräs kelvollinen ratkaisu:
(3,3,0,0,L) -> (1,3,2,0,R) -> (2,3,1,0,L) -> (0,3,3,0,R) -> (1,3,2,0,L) ->
(1,1,2,2,R) -> (2,2,1,1,L) -> (2,0,1,3,R) -> (3,0,0,3,L) -> (1,0,2,3,R) ->
(2,0,1,3,L) -> (0,0,3,3,R)
eos
puts "END TEHTÄVÄ 4"

puts "\nTEHTÄVÄ 5 BEGIN"
node1 = Node.new
node2 = Node.new(2,2,1,1,"right")
node3 = Node.new(2,3,1,0,"left")
node4 = Node.new(0,3,3,0,"right")
node5 = Node.new(1,3,2,0,"left")

s = Stack.new
q = Queue.new

s.push node1
s.push node2
s.push node3
s.push node4
s.push node5
q.enqueue node1
q.enqueue node2
q.enqueue node3
q.enqueue node4
q.enqueue node5

puts "stack size: #{s.size}"
puts "queue size: #{q.size}"

puts "(kann. vasemmalla, läh. vasemmalla, kann. oikealla, läh. oikealla, veneen sijainti)"

puts "stack:"
5.times do
  puts s.pop
end

puts "queue:"
5.times do
  puts q.dequeue
end

puts "stack size: #{s.size}"
puts "queue size: #{q.size}"
puts "END TEHTÄVÄ 5"

puts "\nTEHTÄVÄ 6 BEGIN"
a = GraphNode.new("A")
b = GraphNode.new("B")
c = GraphNode.new("C")
d = GraphNode.new("D")
e = GraphNode.new("E")
f = GraphNode.new("F")

a.neighbours = [b,c,d]
b.neighbours = [a]
c.neighbours = [a,f]
d.neighbours = [a,f]
e.neighbours = [f]
f.neighbours = [c,d,e]

puts "Syvyyssuuntainen haku:"
dfs(a)
route(a,f)

[a,b,c,d,e,f].each {|n| n.reset }

puts "\nLeveyssuuntainen haku:"
bfs(a)
route(a,f)
puts "END TEHTÄVÄ 6"