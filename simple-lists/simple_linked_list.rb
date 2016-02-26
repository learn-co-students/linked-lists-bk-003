require 'pry'
class Node
	attr_accessor :data, :next

	def initialize(data, next_node)
		@data = data
		@next = next_node
	end
end

class LinkedList
	attr_writer :head

	def initialize(data)
		@data = data
		@head = Node.new(@data, nil)
	end

	def head
		@head.data
	end

	def index_at(index)
		counter = 0
		current_node = @head
		return current_node.data if index == 0
		while counter < index
			return nil if current_node.next == nil
			current_node = current_node.next
			counter += 1
		end
		current_node.data
	end

	def insert_at_index(index, data)
		counter = 0
		current_node = @head
		while counter < index - 1
			current_node.next = Node.new(nil,nil) if current_node.next == nil
			current_node = current_node.next
			counter += 1
		end
		new_node = current_node.next
		current_node.next = Node.new(data, new_node)
	end

	def unshift(data)
		self.head = Node.new(data, @head)
	end

	def push(data)
		counter = 0
		current_node = @head
		while current_node.next != nil
			current_node = current_node.next
			counter += 1
		end
		current_node.next = Node.new(data, nil) if current_node.next == nil
		current_node.data
	end

	def reverse
		new_head = last
		current_node = @head
		while current_node.next != new_head
			current_node = current_node.next
		end
		current_node.next = nil
		new_head.next = current_node
		if @head.next != nil
			self.reverse
		end
		binding.pry
		@head = new_head
	end

	def last
		current_node = @head
		counter = 0
		while current_node.next != nil
			current_node = current_node.next
			counter += 1
		end
		new_head = current_node	
	end

end