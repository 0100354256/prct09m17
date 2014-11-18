# create a Struct with :value and :next
Node = Struct.new(:value, :next, :prev)

class List
 include Enumerable
 attr_accessor :head

 def initialize(first_value=nil)
   if first_value
     @head = Node.new(first_value, nil)
   end
 end
 
 def each
   actual = @head
   while actual != nil
     yield actual.value
     actual = actual.next
   end
 end
 
 def removeFirst
   current_node = @head
   if current_node[:next]
     @head = current_node[:next]
     current_node[:prev] = nil
   else
     @head = nil
   end
 end

 def add(value)
  if value.kind_of?(Array)
    index = 0
    if head[:value].nil?
      head[:value] = value[0]
      index = 1
    else

      while value[index] do
        newNode = Node.new(value[index], nil, nil)
        current_node = @head

        while current_node[:next]
          current_node = current_node[:next]
        end

        current_node[:next] = newNode
	newNode[:prev] = current_node
        index = index + 1
      end
    end

    nil
  else
    if head[:value].nil?
      head[:value] = value
    else
      newNode = Node.new(value, nil)
      current_node = @head

      while current_node[:next]
        current_node = current_node[:next]
      end

      current_node[:next] = newNode
      newNode[:prev] = current_node
    end
    nil
  end
 end

 def to_s
  if @head
    s = ""

    current_node = @head
    while current_node[:next]
      s = s + current_node[:value] + " -> " 
      current_node = current_node[:next]
    end

    s = s + current_node[:value]
  else 
    nil
  end
 end
end