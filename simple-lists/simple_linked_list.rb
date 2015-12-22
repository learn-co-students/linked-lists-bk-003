class Node
	attr_accessor :data, :next
	def initialize(data, next_node)
		@data = data
		@next = next_node
	end
end

class LinkedList
	attr_accessor :head
	def initialize(data)
		@head = Node.new(data, nil)
	end

	def index_at(index)
		i = 0
		current = head
		until i >= index
			return nil if current.next == nil
			current = current.next
			i+=1
		end
		current.data
	end

	def insert_at_index(index, val)
		i = 0
		current = head
		until i >= index-1
			current.next = Node.new(nil, nil) if current.next == nil
			current = current.next
			i+=1
		end
		temp = current.next
		current.next = Node.new(val, temp)
	end

	def unshift(val)
		self.head = Node.new(val, head)
	end

	def push(val)
		current = head
		until current.next == nil
			current = current.next
		end
		current.next = Node.new(val, nil)
	end

	def reverse(new_head=nil)
		base = find_last(head)
		current = head
		until current.next == base
			current = current.next
		end
		if new_head
			find_last(new_head).next = current.next
		else
			new_head = base
		end
		current.next = nil
		if head.next == nil
			find_last(new_head).next = current
			self.head = new_head
		else
			reverse(new_head)
		end
	end

	def find_last(node)
		current = node
		if current.next == nil
			return current
		else
			find_last(current.next)
		end
	end
end