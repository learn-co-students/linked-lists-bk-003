require 'pry'
class Node

	attr_accessor :next, :data

	def initialize(value,next_node)
		@data = value
		@next = next_node
	end



end # end of class Node

class LinkedList
  attr_accessor :head
	
	def initialize(head)
    @head = Node.new(head,nil)
	end
    
  
 
 def index_at(num)
   counter = 0
   current = @head
   while counter != num
	   current = current.next
	   counter +=1
   end # end while
   current == nil ? current : current.data
 end

  def insert_at_index(index, value)
	   counter = 0
	   current = @head
	   while counter != index 
		   if current.next == nil
         current.next = Node.new(nil,nil)
       end
       current = current.next
		   counter += 1
	   end # end while
	   if current.data == nil
	     current.data = value
	   else
       bumped_up = current.data
       current.data = value
	     current.next = Node.new(bumped_up, nil)
	   end # end if
	end
  
  def push(data)
    current = @head
    while current.next 
    current = current.next
    end
    current.next = Node.new(data, nil)
  end

  def unshift(data)
    current = @head.dup
    @head.data = data
    @head.next = current
  end
end #end of Linkedlist
















